TARGET = gpioserver

$(TARGET) : server.c libbcm2835.a
	$(CC) -o $@ $^
clean : 
	rm -rf $(TARGET)
