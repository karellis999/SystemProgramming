; Programm Hello3 
.MODEL SMALL
.STACK 100h
.DATA
Hello DB 'Hello!$'
.CODE  
start:
MOV AX,@data
MOV DS,AX
LEA DX,Hello 
MOV AH,09h 
INT 21h 
MOV AH,4Ch 
MOV AL,00h 
INT 21h 
END start