MYCODE SEGMENT 'CODE'
	ASSUME CS:MYCODE, DS:MYCODE
	
LAB_TITLE DB 'Lab 1$'
HEX_TABLE DB '0123456789ABCDEF'
buf DB 20 dup(' ')
LET DB 'Ђ'

START:		 
	;load segment data reg ds
	PUSH CS
	POP DS
	;main
	call CLRSCR
	mov dx, offset LAB_TITLE
	call putstr
	call clrf
	;wait for user input
	
	;loop
	MOV CX, 10
	Cycle:
	
	LOOP Cycle
	MOV AH, 01H
	INT 21H
	;quit
	MOV AL, 0
	MOV AH, 4CH
	INT 21H
	
	PUTCH PROC
	    MOV AH, 02
	    INT 21H
		ret
PUTCH ENDP

putstr proc
	mov ah, 09
	int 21h
	ret
putstr endp

clrf proc
	mov dl, 10
	call putch
	mov dl, 13
	call putch
	ret
clrf endp

CLRSCR PROC
    call CLRF
    mov  ah , 0H
    mov  al , 3H
    int  10H
    ret
CLRSCR ENDP

PRINTHEX PROC
	; first digit
	MOV AL, LET
	SHR AL, 4
	LEA BX, HEX_TABLE
	XLAT
	
	;print first digit and replace it with * if its equal to 8
	MOV DL, AL
	CMP AL, '8'
	JE PRINTSTAR
	JMP CONTINUE
	PRINTSTAR:
	MOV DL, '*'
	CONTINUE:
	CALL PUTCH
	
	;second digit
	MOV AL, LET
	AND AL, 0Fh
	XLAT
	MOV DL, AL
	CALL PUTCH
	MOV DL, 'h'
	CALL PUTCH
	RET
PRINTHEX ENDP
MYCODE ENDS
END START	