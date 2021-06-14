# Assignment 5

余北辰 519030910245



1. (Array initialization) Allocate 100 bytes of data, and assign value from 0-99 to those bytes.



```asm
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
```



2. (If/else translation) Allocate a word in the memory with any value and another word for storing its absolute value. Write the program to perform the conversion.



```asm
.MODEL SMALL
.STACK 64
;-------------------
        .DATA
NUM    DW      -1
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
```



3. (Function argument and return value) Convert the following C code to the 8086 assembly code. You need to handle the function call argument passing and return value properly. [Hint: you can use stack for passing the argument and register AX for receiving the return value of the function.]

   

```asm
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
```



4. (Function local variable) Convert the foo() function to assembly (no need to convert main). You need to handle the local variables properly. [Hint: you can use the stack for local variables and remember to clean the stack before return.]



```asm
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
```

