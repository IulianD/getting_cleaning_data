# run_analysis.R

Script that performs the data transformations detailed in the project requirements
for the "Getting and cleaning data" course.

Here's how the project requirements map with different parts of the script :

* Uses descriptive activity names to name the activities in the data set. - lines 8 and 37

* Appropriately labels the data set with descriptive variable names. - lines 10, 43 and 68

* Extracts only the measurements on the mean and standard deviation for each measurement. - line 31

* Merges the training and the test sets to create one data set. - line 52

* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  - lines 62 to 71


The script is heavily commented, here I'll just clarify some of the decisions which might seem unclear or peculiar:

* After reading the main information in the parent folder, I declare a function (processChunk) that takes care of the low level processing of each of the 2 datasets(test and train). I then apply this function in parallel (using the "parallel" library and the parallel equivalent of lapply - mclapply) over the 2 subfolders. The parallel approach only works on Linux (and possibly Mac, didn't test there) where it's about 30% faster than the serial execution. On Windows it fails back silently to serial execution.

* I do not use the merge() to "use descriptive activity names", I created a mapping list instead (id to activity name) and used it as a dictionary (at line 37). Main reason being that I wrote the script before getting to the "merge" lesson in the course. Still seems to me a valid approach and [Tim Toady](http://www.catb.org/jargon/html/T/TMTOWTDI.html) would probably agree.

* Instead of using read.csv() or read.table() to read the big X_ datasets I preferred to use scan() to load them in to a vector. The reasoning here was: this course is about data cleaning, there might be some gremlins lurking  somewhere, it would be easier to flush them out from a vector. I'll know that my vector is clean when:
    * it contains only numbers (and possibly NA but not NAN)
    * its length equals 561 * number of lines in Y_ - we need to have the same number of observations for X_ and Y_.
    
 Then it's just a question of transforming the vector into a data table. I do this by transforming it first into a matrix. As matrixes are populated the "wrong" way around (columns first), I need to transpose it first and then make it a data.table.
 
 As it turns out I was way too suspicious, a simple read.csv() would have worked too. Oh well.

