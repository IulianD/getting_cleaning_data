run_analysis <- function(wd='.'){
     library(data.table)
     library(parallel)
    #load the activities:
    activities <- read.csv(paste(wd,'/activity_labels.txt', sep=''), sep=' ', header=F)
    # create a list with activity number pointing to activity name,
    #useful later, to insert activity names in the data frames
    activitiesMap <- as.list(as.vector(activities[,'V2']))
    #then to features:
    features<- read.csv(paste(wd,'/features.txt', sep=''), sep=' ', header=F)
    # these will be the headers of the final data frame, so tidy them up:
    features <- make.names(as.vector(features[,2]), unique=TRUE)
    # will need this later:
    nHeaders = length(features)
    processChunk <- function(chunkName){
        # first read in x_test.txt as character:
        x.vec <- scan(paste(wd, '/', chunkName, '/X_',chunkName, '.txt', sep=''),what=character())
        x.vec <- as.numeric(x.vec)
        # we load x.vec in a matrix with nrow = number of features 
        #(we know it's 561 but we want to make it as generic as possible)
        # this is because matrixes are populated column first
        x.matrix <- matrix(x.vec, nrow = nHeaders, dimnames = list(features,NULL))
        #we need to transpose the matrix before loading it into a data frame
        # (because of the column first thing above)
        x.matrix <- t(x.matrix)
        # and now convert it to a data.table:
        x.table <- data.table(x.matrix)
        # select only the mean and std columns (as per requirements)
        # I remove also the meanFreq... columns as they don't seem
        # to represent real means
        x.table <- x.table[,grep('mean\\W|std', names(x.table)), with=FALSE]
        
        # OK, finished with x, on to y (the actual activities):
        y.vec <- scan(paste(wd, '/', chunkName, '/Y_',chunkName, '.txt', sep=''), sep=' ')
        # first transform the above vector of activity IDs into a list of
        # activity names (see activitiesMap defined outside this function):
        y.named <- activitiesMap[y.vec]
        # and unlist it to obtain a vector:
        activity.name <- unlist(y.named)
        # finished with y, on to subjects:
        subjects <- data.table(read.csv(paste(wd, '/', chunkName, '/subject_',chunkName, '.txt', sep=''), sep= ' ', header=F))
        # give them a header:
         setnames(subjects,'subject.id')
        # finished subjects, now cbind everything together:
        cbind(subjects, activity.name, x.table)

    }
    # apply the function over the 2 datasets:
    total.list <- mclapply(list('train','test'), processChunk)
    
    # bind the 2 data tables together:
    total.dt <- rbind(total.list[[1]], total.list[[2]])   
    # we now need to calculate the means for all columns by activity and subject
    # we need a subsetting expression of this form:
    # total.dt[, list(mean(first..column), mean(second..column)....), by= list(activity, subject)]
    # As that takes too much typing I'll use a (protracted) method:
    # - create a string with the necessary expression
    # - parse and eval it
    # first, take the names of all the columns except the first 2 ,add "mean(),"
    # around them and paste them together
    averages <- paste('mean(', names(total.dt)[3:length(names(total.dt))], '),',sep='')
    # get rid of the last comma in the string:
    averages[which(averages==tail(averages, n=1))] <- sub (',','',tail(averages,n=1))
    # create the subsetting expression as described above:
    expr <- paste('total.dt[,list(',paste(averages, collapse=" "),'),by=list(subject.id, activity.name)]',sep='')
    # now parse and eval it:
    final <- eval(parse(text = expr))
    setnames(final, names(final)[3:length(names(final))], 
             paste('AverageOf.',names(total.dt)[3:length(names(total.dt))],sep=''))
    # write it down:
    write.table(final, paste(wd,'/uci_har_dataset.txt', sep=''), sep=',', row.names=FALSE)
    
}