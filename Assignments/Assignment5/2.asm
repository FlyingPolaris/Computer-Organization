.MODEL SMALL
.STACK 64
;-------------------
        .DATA
NUM    DW      -5
ANS    DW      ?
;-------------------
        .CODE
MAIN    PROC    FAR
        MOV     AX, @DATA
        MOV     DS, AX
        MOV     BX, NUM
        CMP     BX, 0
        JGE     FINISH
        MOV     AX, 0
        SUB     AX, BX
        MOV     BX, AX 
FINISH: MOV     ANS, BX
        MOV     AH, 4CH
        INT     21H    
MAIN    ENDP
        END     MAIN