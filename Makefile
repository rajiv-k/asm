hello: hello.asm
	nasm -o hello.o -f macho64  hello.asm
	ld -macosx_version_min 10.7.0 -lSystem -o hello hello.o -no_pie

boot: boot.asm
	nasm -o boot.bin -f bin boot.asm

string: string.asm
	nasm -o string.bin -f bin string.asm

.PHONY: clean
clean:
	rm -f *.o *.bin

.PHONY: run
run:
	qemu-system-x86_64 -drive file=boot.bin,format=raw -D qemu.log

.PHONY: run-string
run-string:
	qemu-system-x86_64 -drive file=string.bin,format=raw -D qemu.log
