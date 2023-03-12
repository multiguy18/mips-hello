CC=mips-linux-gnu-gcc
CCFLAGS=-nostdlib -static

AS=mips-linux-gnu-as

OBJS= minclib.o\
	system_asm.o\
	ctest.o\
	hello_asm.o

OUTDIR=out
OUTNAME=$(OUTDIR)/hello

all: $(OUTNAME)

clean:
	rm -f $(OUTNAME)
	rm -f *.o

.PHONY:	all clean

$(OUTNAME):	$(OBJS) | $(shell mkdir -p $(OUTDIR))
	$(CC) $(OBJS) -o $(OUTNAME) $(CCFLAGS)

%_asm.o:	%.s
	$(AS) $< -o $@

%.o:	%.c
	$(CC) $< -o $@ $(CCFLAGS) -g -r -mno-abicalls -O2
