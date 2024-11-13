CC = gcc
CFLAGS = -Os -s -nostartfiles -no-pie -static -fno-builtin
LDFLAGS = -Wl,-Tlinker.ld 
NAME = nosu

all:
	$(CC) $(CFLAGS) ./$(NAME).S $(LDFLAGS) -o ./$(NAME)

clean:
	rm -rf $(NAME)
