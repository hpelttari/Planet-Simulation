Input file instructions


Every bit of information in the input file shoud be in a different line.
The first line should contain the number of planets.
Starting from the second line the file should contain the masses of the objects, each in their own line. First object should be the center object (for example the sun) which is the reference frame of the simulation.
After all of the masses are listed in their own lines comes the initial distances from the center object. The distance given for the center object should naturally be 0, and the order of the objects should remain same throughout the file.
Then comes positions of the objects on x-axis, after that the positions on y-axis and after that in z-axis.
Next should come the velocities in x,y and z-direction in a similar manner than the positions.
After that give the total length of the simulation, the time step used in the simulation, the interval which info should be printed to the screen and interval at which the positions should be saved to the output file all in their own lines.
The file should not contain any letters and all of the numbers should contain just numbers and no other characters. The values should be given in SI-units.
The positions.xyz file in the folder contains the output file from the solar system simulation with a 500 second time step. If you wish to make a new simulation you shouldn’t have a file named positions.xyz in the folder where the program creates the output file because that will give an error. Delete, move or rename the existing output file if that happens.
To run the program you should give the name of the input file as a command line argument. For example:
./a.out solarsystem.txt
