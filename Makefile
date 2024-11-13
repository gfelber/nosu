build: setup
	nasm -f elf64 nosu.nasm -o ./dist/nosu.o 
	ld -Ttext=0x4000b0 -znosectionheader --strip-all ./dist/nosu.o -o ./nosu

setup: 
	mkdir -p dist

clean:
	rm -r nosu dist
