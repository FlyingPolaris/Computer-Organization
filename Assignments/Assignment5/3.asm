.MODEL SMALL
.STACK 64
;-------------------
        .DATA
DATA_A    DW    -1
DATA_B    DW    1
DATA_C    DW    ?
DATA_D    DW    ?
;-------------------
        .CODE
MAIN    PROC    FAR
        MOV     AX, @DATA
        MOV     DS, AX
        MOV     BX, DATA_A
        PUSH    BX
        CALL    ABS
        POP     BX
        MOV     DATA_C, AX
        
        MOV     BX, DATA_B
        PUSH    BX
        MOV     BX, DATA_A
        PUSH    BX
        CALL    ADD1
        POP     BX
        MOV     DATA_D, AX
        
        MOV     AH, 4CH
        INT     21H
MAIN    ENDP


ABS     PROC
	MOV	BP, SP	
        MOV     AX, [BP] + 2
        CMP     AX, 0
        JGE     FINISH
        MOV     BX, 0
        SUB     BX, AX
        MOV     AX, BX
FINISH: RET
	
ABS     ENDP


ADD1     PROC
	MOV	BP, SP	
        MOV     AX, [BP] + 2
        MOV     BX, [BP] + 4
        ADD     AX, BX
    
	RET
ADD1     ENDP

END     MAIN