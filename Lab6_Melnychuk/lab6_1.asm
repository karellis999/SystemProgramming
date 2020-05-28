model small
stack 256
.data
Train struc
names db 10 dup(' ')
number dw ?
start dw ?
finish dw ?
time dw ?
Train ends
step = 18
trains Train <'A$',11,8,12,0>
       Train <'B$',12,5,23,0>
       Train <'C$',13,3,10,0>
       Train <'D$',14,2,22,0>
expan Train <>
.code
FindTime proc near
    xor     ax,ax
    xor     bx,bx
    xor     si,si
    mov     cx,4
loop1:
    mov     bx,si
    mov     ax,trains.finish[bx]
    mov     dx,trains.start[bx]
    sub     ax,dx
    
    mov     trains.time[bx],ax
    add     si, step
    loop    loop1
ret
endp

FindMax proc near
    xor     ax,ax
    xor     bx,bx
    xor     si,si
    mov     cx,4
loop2:
    mov     bx, si
    mov     ax,trains.time[bx]
    cmp     ax, 17
    jg      again
next:
    mov     dl, 10
    mov     ah, 02h
    int     21h

    mov     ah,09h
    lea     dx, trains.names[bx]
    int     21h
    

    mov     dl, 10
    mov     ah, 02h
    int     21h
    
    mov     es,bx
    xor     ax,ax
    mov     ax,trains.start[bx]
    aam 
    add     ax, 3030h   
    mov     bx, ax
    mov     ah, 02   
    mov     dl, bh   
    int     21h  
    mov     dl, bl   
    int     21h 
    

    mov     dl, 10
    mov     ah, 02h
    int     21h
    
    mov     bx,es
    xor     ax,ax
    mov     ax,trains.finish[bx]
    aam 
    add     ax, 3030h   
    mov     bx, ax
    mov     ah, 02   
    mov     dl, bh   
    int     21h  
    mov     dl, bl   
    int     21h
    
    

    mov dl, 10
    mov ah, 02h
    int 21h
    
again:
    add     si, step
    loop    loop2
ret
endp    
main:
    mov ax,@data
    mov ds,ax
    call FindTime  
    call FindMax
      
exit:
    mov ax,4c00h
    int 21h
    end main