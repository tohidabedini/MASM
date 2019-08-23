org 100h

.data

str db 12,13,"Enter Values: $"
str1 db 0dh,0ah,"Bubble Sort Completed $"

m_max db " Max is: $"
m_min db "Min is: $"

intArray db 100 dup(0)
.code

mov ah,9
lea dx,str
int 21h

mov cx,50
mov bx,offset intArray
mov ah,1

inputs:
mov ah,1
int 21h
mov [bx],al
sub [bx],48
int 21h
mov [bx+50],al
sub [bx+50],48
inc bx
 
mov ah,2
mov dl,44
int 21h

Loop inputs

mov cx,50
mov bx,offset intArray

mult:
mov al,[bx]  
mov dl,10
mul dl
add al,[bx+50]
mov [bx],al
inc bx
Loop mult




mov cx,50
dec cx

nextscan:
mov bx,cx
mov si,0

nextcomp:
mov al,intArray[si]
mov dl,intArray[si+1]
cmp al,dl

jc noswap

mov intArray[si],dl
mov intArray[si+1],al

noswap:
inc si
dec bx
jnz nextcomp

loop nextscan

 

mov ah,9
lea dx,str1
int 21h
 
 
mov cx,50
mov bx,offset intArray


; this loop to display elements on the screen
back_to_array:
mov ah,0
mov al,[bx]
mov dl,10
div dl
add al,48
mov [bx],al
add ah,48
mov [bx+50],ah


inc bx
loop back_to_array


mov ah,9
mov dx,offset m_min
int 21h 

mov ah,2
mov bx,offset intArray


mov dl,[bx]
int 21h

mov dl,[bx+50]
int 21h


mov ah,9
mov dx,offset m_max
int 21h


mov ah,2
mov dl,[bx+49]
int 21h

mov dl,[bx+99]
int 21h

ret