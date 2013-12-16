CC 		= g++
# compiler flags:
  #  -g    adds debugging information to the executable file
  #  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -g -Wall
		  #-O2 -fopenmp

TARGET = mSGA 

all: clean $(TARGET) test

$(TARGET): $(TARGET).cpp
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).cpp

clean:
	$(RM) $(TARGET)

test:
	time -p ./$(TARGET)
