CC 		= g++
# compiler flags:
  #  -g    adds debugging information to the executable file
  #  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -g -Wall
		  #-O2 -fopenmp

TARGET = mSGA 
FILE    = mSGA.cpp 


all: clean $(TARGET) test

$(TARGET): $(FILE)
	$(CC) $(CFLAGS) -o $(TARGET) $(FILE)

clean:
	$(RM) $(TARGET)

test:
	time -p ./$(TARGET)
