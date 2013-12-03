TARGET = libsprec.so
OBJECTS = src/wav.o src/flac_encoder.o src/web_client.o src/recognize.o src/jsonz.o src/j_object.o
CFLAGS = -g -std=gnu99 -fPIC -c -Wall -Iinclude
LDFLAGS = -g -std=gnu99 -shared -fPIC -lcurl -lFLAC -lasound
CC = gcc
LD = $(CC)

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(LD) -o $@ $^ $(LDFLAGS)

tool: sprec

simple: sprec_simple

sprec: examples/tool.o $(TARGET)
	$(LD) -L. -o $@ $< -lsprec

sprec_simple: examples/simple.o $(TARGET)
	$(LD) -L. -o $@ $< -lsprec

%.o: %.c
	$(CC) $(CFLAGS) -o $@ $^

install: $(TARGET)
	cp $(TARGET) /usr/lib/
	cp -r include/sprec /usr/include/

clean:
	rm -f $(TARGET) sprec sprec_simple src/*.o examples/*.o *~

.PHONY: all clean install tool sprec

