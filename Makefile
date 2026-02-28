TARGET = helloworld
SOURCES = main.c hellofunc.c
OBJECTS = main.o hellofunc.o
CFLAGS = -Wall -g
LFLAGS = -L. -lfibonacci

all: libfibonacci.a $(TARGET)

main.o: main.c
	g++ $(CFLAGS) -c main.c

hellofunc.o: hellofunc.c
	g++ $(CFLAGS) -c hellofunc.c

fibonacci.o: fibonacci.c fibonacci.h
	g++ $(CFLAGS) -c fibonacci.c

libfibonacci.a: fibonacci.o
	ar rcs libfibonacci.a fibonacci.o

$(TARGET): $(OBJECTS) libfibonacci.a
	g++ $(OBJECTS) $(LFLAGS) -o $(TARGET)

clean:
	rm -f $(OBJECTS) fibonacci.o libfibonacci.a $(TARGET) *.zip

zip:
	zip firstname_lastname_cs1_assignment3.zip main.c hellofunc.c helloheader.h fibonacci.c fibonacci.h Makefile
