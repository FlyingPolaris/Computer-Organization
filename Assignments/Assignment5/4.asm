.MODEL SMALL
.STACK 64
;-------------------
        .DATA
DATA_A    DW    ?
;-------------------
        .CODE
MAIN    PROC    FAR
        MOV     AX, @DATA
        MOV     DS, AX
        MOV     BX, DATA_A
        CALL    FOO
        MOV     AH, 4CH
        INT     21H
MAIN    ENDP


FOO     PROC
        PUSH    CX
        PUSH    BX
        PUSH    AX
        ...; Use AX as a, BX as b and CX as c in the foo()
        POP     AX
        POP     BX
        POP     CX	
FOO     ENDP

END     MAIN