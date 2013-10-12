CC 		= g++
# compiler flags:
  #  -g    adds debugging information to the executable file
  #  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -g -Wall
		  #-O2 -fopenmp
# the build target executable:


all: clean ga test

ga: ga.cpp
	$(CC) $(CFLAGS) -o ga ga.cpp

clean:
	$(RM) ga

test:
	time -p ./ga
