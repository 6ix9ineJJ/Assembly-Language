org 100h

jmp start
Section .data
msg db 'Enter 7 Numbers: $'
line1 db ' palindrome is the answer $'
line2 db ' Not palindrome is the answer $'
data  db 0,0,0,0,0,0,0,'$'

Section .code

Display:

    push bp
    mov bp,sp
    mov dx,[bp+4]
    mov ax, 0
    mov ah, 9
    int 0x21
    pop bp

    ret 2

userInput:

    
    mov ah,7
    int 21h
    mov [data+bx], al
    add bx , 1

    mov ah,7
    int 21h
    mov [data+bx], al
    add bx ,1

   mov ah,7
    int 21h
    mov [data+bx], al
    add bx ,1


   mov ah,7
    int 21h
    mov [data+bx], al
    add bx ,1


   mov ah,7
    int 21h
    mov [data+bx], al
    add bx ,1


   mov ah,7
    int 21h
    mov [data+bx], al
    add bx ,1


   mov ah,7
    int 21h
    mov [data+bx], al
    add bx ,1


    mov dx,data
    mov ah,9
    int 21h
    ret

palindrome:

    mov ah,[data]
    mov bh,[data+6]

    mov ah , [data+1]
    mov bh, [data+5]

    mov ah , [data+2]
    mov bh , [data+4]

    cmp ah,bh


    je notequal
        mov ax,line2
        push ax
        call Display
     ret

notequal:
    mov ax,line1
    push ax
    call Display
     ret


start:

    mov ax,msg
    push ax

    call Display
    call userInput
    call palindrome  ;function calls
    mov ax, 0x4c00
    int 0x21
