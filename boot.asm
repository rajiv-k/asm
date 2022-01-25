mov ah, 0x0e
mov al, 64
mov bh, 0

loop:
    inc al
    cmp al, 'Z' + 1
        je exit
    cmp bh, 0
        je print_lower
    cmp bh, 1
        je print_upper

print_upper:
    int 0x10
    mov bh, 0
    jmp loop

print_lower:
    add al, 32
    int 0x10
    sub al, 32
    mov bh, 1
    jmp loop

exit:
    jmp $

times 510-($-$$) db 0
db 0x55, 0xaa
