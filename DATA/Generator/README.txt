Provided executable "gensvmdat" randomly generates points in R4 that take values inside [0,1]. If the sum of their coordinates are greater than 2 the point belongs to the class +1; otherwise, to class -1.

To run code:
	$> gensvmdat file p seed
where file is the file name where data will be written, p is the number of points and seed is a number for the random generator.

Points marked with "*", randomly distributed, belong to an incorrect class.

In order to convert the file that the executable generated to AMPL input data we need to:
- delete the * (otherwise they are interpreted as character strings for the language)
- use the R script we programmed
(Notice we will need to do some further modifications in the file written by the R script, such as parameter specifications)