[org 0x7c00]

mov ah, 0x0e ;scrolling teletype BIOS routine
mov bx, hello
loop:
    mov al, [bx]
    cmp al, 0
        je exit
    int 0x10
    inc bx
    jmp loop

exit:
    jmp $

hello:
    db "Mary had a little lamb and it was... delicious!", 0

times 510-($-$$) db 0
db 0x55, 0xaa
