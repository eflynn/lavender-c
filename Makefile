
CFLAGS   = 
LEX      = flex

objects  = lavender.o scan.o parser.tab.o 

.PHONY: all
all:	lavender

lavender: $(objects)

scan.o: parser.tab.h

%.tab.c %.tab.h: %.y
	bison -d $<

.PHONY: clean
clean:
	rm -f lavender $(objects) *.tab.[ch]
