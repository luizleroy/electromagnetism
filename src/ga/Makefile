CC 		= g++
# compiler flags:
  #  -g    adds debugging information to the executable file
  #  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -g -Wall
		  #-O2 -fopenmp
# the build target executable:
TARGET = ga
EXT    = cpp 


all: clean $(TARGET) test

$(TARGET): $(TARGET).$(EXT)
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).$(EXT)

clean:
	$(RM) $(TARGET)

test:
	time -p ./$(TARGET)
