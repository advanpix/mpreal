LDIR=/usr/local/lib/

example: example.o mpreal.o dlmalloc.o
	g++ example.o mpreal.o dlmalloc.o $(LDIR)libmpfr.a $(LDIR)libgmp.a -o example

mpreal.o: mpreal.cpp mpreal.h
	g++ -c mpreal.cpp

example.o: example.cpp mpreal.h
	g++ -c example.cpp

dlmalloc.o: dlmalloc.c dlmalloc.h
	g++ -c dlmalloc.c


clean:
	rm -f *.o 

