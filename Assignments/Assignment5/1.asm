.MODEL SMALL
.STACK 64
;-------------------
        .DATA
ARRAY   DB  100 DUP(?)  

;-------------------
        .CODE
MAIN    PROC    FAR
        MOV     AX, @DATA
        MOV     DS, AX
        MOV     BX, OFFSET ARRAY
        MOV     CX, 100
        MOV     AL, 0H
BACK:   MOV     [BX], AL
        INC     AL
        INC     BX
        LOOP    BACK
        MOV     AH, 4CH
        INT     21H
MAIN    ENDP
        END     MAIN