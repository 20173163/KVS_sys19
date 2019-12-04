# specify compiler, compile flags
CC = gcc
OPTS = -Wall -O -c
# specify target here (name of executable)
TARG = static
TARG2 = dll
# specify all source files here
HEADER = kvs.h
SRCS = put.c get.c open.c close.c
STATIC = test_static.c $(SRCS)
DLL = test_dll.c $(SRCS)
# this translates .c files in src list to .o’s
OBJS = $(STATIC:.c=.o)
OBJS2 = $(DLL:.c=.o)


# generate "static" and "dll" executable
all: $(TARG) $(TARG2)
# generate "static"  executable
$(TARG): $(OBJS)
	$(CC) -o test_$(TARG) $<
# generate "dll" executable
$(TARG2): $(OBJS2)
	$(CC) -o test_$(TARG2) $<
# this is a generic rule for .o files
%.o: %.c $(HEADER)
	$(CC) $(OPTS) $< -o $@
# clean line
clean: 
	rm -f test_$(TARG) test_$(TARG2) $(OBJS) $(OBJS2)
