hello: hello.asm
	nasm -o hello.o -f macho64  hello.asm
	ld -macosx_version_min 10.7.0 -lSystem -o hello hello.o -no_pie

boot: boot.asm
	nasm -o boot.bin -f bin boot.asm

.PHONY: clean
clean:
	rm -f hello.o hello

.PHONY: run
run:
	qemu-system-x86_64 -drive file=boot.bin,format=raw -D qemu.log
