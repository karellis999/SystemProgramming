;D+A*(T-C)
.model small
.stack 100h
.data

A DB ?
C DB ?
D DB ?
T DB ?
Y DW ?
.code
start:
mov ax,@data 
mov ds,ax    

mov A,3            
mov C,2     
mov D,4
mov T,7   

MOV AL,T        ;AL=T=7
MOV CL,C        ;CL=C=2
SUB AL,CL       ;AX=AL-CL=7-2=5
MUL A           ;AX=AX*A=5*3=15

MOV CL,D        ;CL=D=4
ADD AX,CX       ;AX=AX+CX=15+4
MOV Y,AX

MOV AH,4CH
INT 21H
END start 
