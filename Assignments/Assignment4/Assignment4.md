# Assignment 4

余北辰 519030910245



#### 1

If the CPU only includes the adder and does not include subtracter, how would the CPU support the subtraction operation for integers?





If the CPU wants to subtract an integer, it just need to add the two's complement of that integer.



#### 2

For each of the following operation, please determine the CF, OF, SF, ZF, and PF in the flag register. 

a. 1234H + 4321H; 

b. 1000H + FFFFH; 

c. 1000H - 2000H; 

d. F000H + F000H; 

e. 2000H - 8000H.



|      |  CF  |  OF  |  SF  |  ZF  |  PF  |
| :--: | :--: | :--: | :--: | :--: | :--: |
|  a   |  0   |  0   |  0   |  0   |  1   |
|  b   |  1   |  0   |  0   |  0   |  1   |
|  c   |  0   |  0   |  1   |  0   |  1   |
|  d   |  1   |  0   |  0   |  0   |  1   |
|  e   |  1   |  1   |  1   |  0   |  1   |



#### 4

Convert the following logical address to physical address and explain which segment each address belongs to.

   a. CS : IP = 1A00H : B000H; 

   b. DS : DI = 1000H : 2000H; 

   c. SS : SP=  2900H : 3A00H.



a. physical address = CS * 16 + IP = 25000H, belongs to code segment.

b. physical address = DS * 16 + DI = 12000H, belongs to data segment.

c. physical address = SS * 16 + SP = 2BA00H, belongs to stack segment.



#### 5

Which pin of 8086 can be used for determining if an access is for the memory module?



The $M/\overline{IO}$ pin.



#### 6

Describe what is a bus cycle.



Bus cycle is the time required for an access to the memory or I/O interface through the bus.



#### 7

Assume SS=3500H, SP=0800H, if the 8086 CPU executes “PUSH AX” instruction 10 times, what are the values of SS and SP? After the 10 push instructions, what are the values of SS and SP if the CPU executes another “POP BX” instruction 6 times?



After the 10 push instructions, SS=3500H, SP=0800H-10*0002H=34ECH

After the 6 pop instructions, SS=3500H, SP=34ECH+6*0002H=34F8H



#### 8

When the 8086 CPU is reset, registers like IP, DS, SS, and ES will be cleared (i.e, set to 0s), but the CS would be set to FFFFH. Can you determine what’s the first instruction the CPU will execute every time when the CPU is reset? Can you explain the reason for such a design?



The address of the first instruction is 16*CS+IP = FFFF0H. There is a jmp at FFFF0H, and it will jump to the entrance of the system bootloader.  

That’s because the address of FFFFOH is in ROM, and the contents in ROM can not be changed. So such a design can make sure that the system can successfully enter the bootloader every time after 8086 CPU is reset.



#### 9

Assume DS=1000H，BX=0200H，SI=02H，the memory addresses of 10200H~10205H include values of 10H, 2AH, 3CH, 46H, 59H, 6BH. What would be value of AX after executing each of the following instruction?

   (1) MOV AX，0200H; (2) MOV AX，[200H]; (3) MOV AX，BX

   (4) MOV AX，3[BX]; (5) MOV AX，[BX+SI]; (6) MOV AX，2[BX+SI]



(1) 0200H

(2) 2A10H

(3) 0200H

(4) 5946H

(5) 463CH

(6) 6B59H







