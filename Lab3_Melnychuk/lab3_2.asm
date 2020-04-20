;N=J/(E+A)*G+(K/D+E)*V
.model small
.stack 100h
.data
A db 1
E db 2
G db 5
K db 21
V db 5
J db 6
D db 7
N db ?
.code
start:
mov ax,@data 
mov ds,ax

mov al,E
mov cl,A
add al,cl
mov cl,al
mov al,J
div cl
mul G
mov ch,al

mov cl,d
mov al,k
div cl
mov cl,e
mov al,cl
mul V

ADD ch,al
mov N,ch

MOV AH,4CH
INT 21H
END start 