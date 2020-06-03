model small
stack 256
.data
myInfo struc
MySurname db 30 dup(' ')
MyName db 30 dup(' ')
MyAge db 30 dup(' ')
MyCity db 30 dup(' ')
My ends
step = 120
myInfo <'Deniska $','Melnychuk $','19 years $','Khmelnytskiy! $'>
expan myInfo<>
       
.code

ShowMe proc near
    xor     ax,ax
    xor     bx,bx
    xor     si,si
    mov     cx,4

    mov     bx,si
    mov     dl, 10
    mov     ah, 02h
    int     21h

    mov     ah,09h
    lea     dx, myInfo.MySurname[bx]
    int     21h
    
    mov     ah,09h
    lea     dx, myInfo.MyName[bx]
    int     21h
    
    mov     ah,09h
    lea     dx, myInfo.MyAge[bx]
    int     21h
    
    mov     ah,09h
    lea     dx, myInfo.MyCity[bx]
    int     21h

ret
endp    
main:
    mov ax,@data
    mov ds,ax
    call ShowMe 
      
exit:
    mov ax,4c00h
    int 21h
    end main