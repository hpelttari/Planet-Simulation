Instructions for compilation


All of the modules and the main program should be first compiled into .o -files. The appropriate commands in linux terminal are:
gfortran -c constants.f90
gfortran -c readvalues.f90
gortran -c velocityverlet.f90
gfortran -c simulation.f90

Then the files should be linked together:
gfortran constants.o readvalues.o velocityverlet.o simulation.o
