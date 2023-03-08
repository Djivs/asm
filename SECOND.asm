MYCODE SEGMENT 'CODE'
	ASSUME CS:MYCODE, DS:MYCODE
LET DB 'A'
START:
	;load segment data reg ds
	PUSH CS
	POP DS
	;print char on screen
	MOV AH, 02
	MOV DL, LET
	INT 21H
	;wait for user input
	MOV AH, 01H
	INT 21H
	;quit
	MOV AL, 0
	MOV AH, 4CH
	INT 21H
MYCODE ENDS
END START	