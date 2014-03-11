Hi,
These are a few simple instructions which if followed will ensure hassle free execution of the State estimation programme:

1) check if you have all the files necessary for the execution: mainprog.m,dataentry.m,programengine.m,busdata.txt,busweightsdata.txt, linedata.txt,lineweightsdata.txt and shuntdata.txt.

2) copy all the files to your working directory

3) run the file mainprog.m

4) follow the instructions that appear during the course of execution of the program.

5) if you want to modify the inputs directly in the input files, then please remember to open the text files using wordpad. otherwise you will not be able to view the matrix type of arrangement.

6)busdata.txt---> this has six columns whose nomenclature is as below: bus status, initial value of voltage, initial value of angle, measured value of voltage, measured real power injection, measured reactive power injection.

7)busweightsdata.txt---> this is a row vector (which means it will be a little bit of a strain for you, but plz bear with me).each bus has three elements corresponding to it...the weights for the measured voltage, the weights for the measured value of real power injection, weights for the measured reactive power injection.

8)linedata.txt---> this has eight colums....the originating bus of the line, the terminating bus, the resistance of the line (p.u), the reactance (p.u), line charging (p.u.), tap magnitude, real power flow from originating to terminating, reactive power flow.

9)lineweightsdata.txt---> this is again a row vector. contains data corresponding to each of the lines....real power flow weights and reactive power weights. 

10)shuntdata.txt---> contains shunt data i.e bus number and the value of the shunt. 