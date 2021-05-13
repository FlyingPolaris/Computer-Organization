# Assignment 3

余北辰 519030910245



#### 7.8

**In Section 7.3, one advantage and one disadvantage of memory-mapped I/O, comparedwith isolated I/O, were listed. List two more advantages and two more disadvantages.**



Advantages:

1. User can define memory ordering rules and memory barriers that apply both to device accesses and normal memory can be defined.
2. User don’t need a whole separate set of opcodes for I/O instructions.

Disadvantages:

1. It potentially complicates your cache controller.
2. It may requires certain specific access widths.

---

#### 7.9

**A particular system is controlled by an operator through commands entered from a keyboard. The average number of commands entered in an 8-hour interval is 60.**

**a. Suppose the processor scans the keyboard every 100 ms. How many times will the keyboard be checked in an 8-hour period?**

**b. By what fraction would the number of processor visits to the keyboard be reduced if interrupt-driven I/O were used?**



a. 8 hour = 480 min = 28800 s = 28800000 ms. So in the 8-hour-period the keyboard will be checked for 288000 times.

b. If interrupt-driven I/O were used, the processor will vist the keyboard only when there is a command. That is to say, the keyboard will be checked for 60 times. So the fraction is $1 - \frac{60}{288000} = 0.999792=99.979\%$.

---

#### 7.10

**Consider a system employing interrupt-driven I/O for a particular device that transfers data at an average of 8 KB/s on a continuous basis.**

**a. Assume that interrupt processing takes about 100 $\mu s$ (i.e., the time to jump to theinterrupt service routine (ISR), execute it, and return to the main program). Determine what fraction of processor time is consumed by this I/O device if it interrupts for every byte.**

**b. Now assume that the device has two 16-byte buffers and interrupts the processor when one of the buffers is full. Naturally, interrupt processing takes longer, because the ISR must transfer 16 bytes. While executing the ISR, the processor takesabout 8 $\mu s$ for the transfer of each byte. Determine what fraction of processor time is consumed by this I/O device in this case.**



a. 8 KB/s = 8192 B/s. So one byte is generated every $\frac{10^6\mu s}{8192}=122.07\mu s$. As we have already assumed that interrupt processing takes about 100 $\mu s$, we can know that fraction of processor time is consumed by this I/O is $\frac{100}{122.07}=81.92\%$.

b. The time interval between interrupts is $16 \times 122.07 = 1953.12 \mu s$. And for each interupt, the first byte needs $100\mu s$, and for the next 15 bytes, each one needs $8 \mu s$. In total, that is $100 + 8 \times 15 =220 \mu s$. So the fraction is $\frac{220}{1953.12}=11.26\%$.



