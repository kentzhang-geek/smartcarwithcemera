TARGET = gpioclient

$(TARGET) : client.c
	gcc -o $@ $^

debug : client.c
	gcc -g -o $(TARGET) $^

clean : 
	rm -rf $(TARGET)
