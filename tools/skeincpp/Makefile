run: build/skeincpp
	build/skeincpp

all: build/skeincpp

build/skeincpp: build/threefish.o build/main.o
	g++ -o build/skeincpp build/threefish.o build/main.o

build/threefish.o: threefish.cpp threefish.h
	g++ -c -o build/threefish.o threefish.cpp

build/main.o: main.cpp
	g++ -c -o build/main.o main.cpp

clean:
	rm -f build/*.0 build/skeincpp
