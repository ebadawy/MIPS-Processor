#MIPS-Processor

###:rocket: Microprocessor without Interlocked Pipeline Stages


MIPS is a reduced instruction set computer (RISC) instruction set (ISA) developed by MIPS Technologies
(formerly MIPS Computer Systems, Inc.), This repo is an implementation of the single-cycle	MIPS datapath
written in verilog.

###:game_die: supported instructions:

- **Arithmetic**: add, addi, sub
- **Load/Store**: lw, sw
- **Logic**: and, andi, or, ori, nor
- **Control flow**: beq, bne, jal, jr, j
- **Comparison**: slt

This repo also contains test benches for different instructions types and modules, I'll describe how to run them
in the following sections.

##Getting Started


You need a simulator to run the code, To install [Icarus](http://iverilog.icarus.com/) (**recommended**) in different platforms, follow steps on this 
[Link](http://iverilog.wikia.com/wiki/Installation_Guide).


To get a copy of the code first you need to install [GIT](http://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
in your machine.

after installing GIT run these cmds in your terminal

    $ git clone git@github.com:ehab93/MIPS-Processor.git
    $ cd MIPS-Processor
Also if you are going to use [Icarus](http://iverilog.icarus.com/) you will need a text editro, any will do but
I'll use [vim](http://www.vim.org/download.php) for it.

##Implementation

This project is developed under [Icarus](http://iverilog.icarus.com/) verilog simulator, However you can use any 
simulator of your choice. 


###:nut_and_bolt: Directories Structure:
 - **Test**: Contains test benches for all modules
 - **program**: Contains test for different instructions types and the main program in test.txt file.
 - **synthesis**: Contains the synthesis script to synthesis the project using [yosys](http://www.clifford.at/yosys/about.html).
 - **lib**: Contains the common module that is used in other different modules.
 - **Rest of dirs**: Each contains its module.
 
###:nut_and_bolt: Code Structure:
  most of the code is designed in both structural and behavioral style, however instruction and data memory
  is designed in the behavioral code style.
  
  Each module of the mips processor is under its own directory and they are all included in cpu file.
  
  - **ALU**: the ALU unite is cascaded from 32 one_bit_alu 
  - **im**: Instruction memory is word addressable, It's initialized using `$readmemh` verilog operation,
  The default text file is `program/test.txt` , Maximum number of instructions that it could contain is 255. 
  - **dm**: Data memory is 32 bit with 256 entries, In the positive edge of the clock when the memWrite signal is 1
  , The input data is written in the address given from the ALU, otherwise the memRead signal is 1 and the output data
  is given form data saved from the ALU given address.
  - **RF**: Register File, any value provided on 5-line Read register number 1 
  port results in the content of the corresponding register 
  being provided on the 32-line Read data 1 port. any value provided on 5-line Read register number 2
  port results in the content of the corresponding register being provided on the 32-line Read data 2 port
  – on the falling edge of write line, values that appear on 
  32-bit Write data port are written into the register with the number specified on the 5-line Write register port.
  - **Control Signals**:

      | RegDst | ALUSrc | memToReg | regWrite | memRead | memWrite | branch | branch_ne | jump | aluOP
----- | ------ | ------ | -------- | -------- | ------- | -------- | ------ | --------- | ---- | -----
R Format | 01 | 0 | 00 | 1 | 0 | 0 | 0 | 0  | 0 | 010 
lw | 00 | 1 | 01 | 1 | 1 | 0| 0 | 0  | 0 | 000 
sw | 00 | 1 | 00 | 0 | 0 | 1 | 0 | 0  | 0 | 000 
beq | 00 | 0 | 00 | 0 | 0 | 0 | 1 | 0  | 0 | 001
bne | 00 | 0 | 00 | 0 | 0 | 0 | 0 | 1  | 0 | 001
J | 00 | 0 | 00 | 0 | 0 | 0 | 0 | 0  | 1 | 000
Jal | 10 | 0 | 10 | 1 | 0 | 0 | 0 | 0  | 1 | 000
addi | 00 | 1 | 00 | 1 | 0 | 0 | 0 | 0 | 0 | 000
andi | 00 | 1 | 00 | 1 | 0 | 0 | 0 | 0 | 0 | 011
ori | 00  | 1 | 00 | 1 | 0 | 0 | 0 | 0 | 0 | 100
  
##Running Tests

Each module have his own test under test sub-directory,
To run them change dir to test and compile&run the testbench, eg.
    
    $ iverlog -o alu_test alu_test.v
    $ vvp alu_test
    
You should have output like this

                   0: a=x     b=x	  op= x   z=z   zero=x
                   5: a=21    b=3	  op= 0   z=1   zero=0
                  10: a=2	  b=5	  op= 1	  z=7   zero=0
                  15: a=5	  b=-4	  op= 2   z=1   zero=0
                  20: a=9	  b=10	  op= 6	  z=-1	zero=0
                  25: a=5	  b=5	  op= 6	  z=0 	zero=1
                  30: a=1	  b=3	  op= 7	  z=1 	zero=0
                  35: a=6	  b=5	  op= 7	  z=0 	zero=1
                  40: a=1	  b=3	  op=12	  z=-4	zero=0


For instructions test it is located under program sub-directory, To run them change directory to `test` and run this
cmd

    $ iverlog -o cpu_test cpu_test.v -DR_TYPE

This will will compile the cpu_test test bench and load the r_type.txt from program directory, The `-DR_TYPE` is 
the reason for loading this file, Possible values that it could take `-DR_TYPE` for R type instruction, `-DI_TYPE` for
I type instruction , `-DBRANCH` for branch instruction, `-DBRANCHN` for bne instruction , `-DJUMP` for j instruction, `-DJAL` for jal instruction, `-DLOOP` to run `program/loop.txt` code or it could be left unspacified and the `program/test.txt` file will be loaded.

## :paperclip: Machine Code

First thing you have to know is that the address start from 1 and goes by one, For assembling the instructions it is almost identical to the regular MIPS machine code except for the j and jal instructions, because this implementation is word addressable, you don't have to multiply by 4, consider the following code

    00000001 j LOOP
    .
    .
    00000008 LOOP: nop
    .
    .
    0000000F j LOOP

op  | target address
--- | --------------
2 | 8

and the hex for this example is `0x08000008`.

## :star2: Run Your First Program!

Following I'll assemble the code in `program/loop.txt` and compile/run it.

    // program/loop.txt
    00000001      addi $s0, $zero,0
    00000002      jal  FUN
    00000003      j   EXIT
    00000004  FUN:addi $t0, $t0, 0
    00000005      addi $t1, $t1, 10
    00000006 LOOP:beq  $t0, $t1, END
    00000007      addi $t0, $t0, 1
    00000008      j    LOOP
    00000009  END:addi $s0, $t0, 0
    0000000A      jr   $ra
    0000000B EXIT:


 instruction | op   |  rs  |  rt  | address/immediate  | hex
------------ | ----  | ---- | ---- | ----------------- | ---
addi $s0, $zero,0 | 8 | 0 | 16 | 0  | 0x20100000
addi $t0, $t0, 0 | 8 | 8 | 8 | 0 | 0x21080000
addi $t1, $t1, 10 | 8 | 9 | 9 | 10 | 2129000a
beq  $t0, $t1, END | 5 | 8 | 9 | 2 | 0x11090002
addi $t0, $t0, 1 | 8 | 8 | 8 | 1 | 0x21080001
addi $s0, $t0, 0 | 8 | 8 | 16 | 0 | 0x21100000

instruction | op  | target address | hex
----------- | --- | -------------- | ---
jal  FUN | 3 | 4 | 0x0C000004
j   EXIT | 2 | 11 | 0x0800000B
j    LOOP | 2 | 6 | 0x08000006

 instruction | op   |  rs  |  rt  | rd   | shamt | funct | hex
------------ | ---- | ---- | ---- | ---- | ----- | ----- | ---
jr   $ra | 0 | 13 | 0 | 0 | 0 | 8 | 0x03E00008

To compile/run this code make sure that you are in test directory then run this cmd

    $ iverilog -o cpu_test cpu_test.v -DLOOP
    $ vvp cpu_test
    
you should have something like this

    WARNING: ./../mem/im.v:41: $readmemh(../program/loop.txt): Not enough words in
    the file for the requested range [1:223].    
    VCD info: dumpfile cpu.vcd opened for out put.    
    $0  = 00000000    
    $at = 00000000    
    $v0 = 00000000    
    $v1 = 00000000    
    $a0 = 00000000    
    $a1 = 00000000    
    $a2 = 00000000    
    $a3 = 00000000    
    $t0 = 0000000a    
    $t1 = 0000000a    
    $t2 = 00000000    
    $t3 = 00000000    
    $t4 = 00000000    
    $t5 = 00000000    
    $t6 = 00000000    
    $t7 = 00000000    
    $s0 = 0000000a    
    $s1 = 00000000    
    $s2 = 00000000    
    $s3 = 00000000    
    $s4 = 00000000    
    $s5 = 00000000    
    $s6 = 00000000    
    $s7 = 00000000    
    $t8 = 00000000    
    $t9 = 00000000    
    $k0 = 00000000    
    $k1 = 00000000    
    $gp = 00000000    
    $sp = 00000000    
    $fp = 00000000
    $ra = 00000003
    
Notice that it through a warning, but there no worries about that. the registers that is affected from this code is $t0 = 10, $t1 = 10 ,$s0 = 10 and $ra = 3.

:bomb: You can also look at the output wave using  [gtkwave](http://iverilog.wikia.com/wiki/GTKWAVE), run this cmd

    $ gtkwave cpu.vcd


![CPU Wave](https://raw.githubusercontent.com/ehab93/MIPS-Processor/master/assets/wave.png)

## :sparkles: Program You Made...

To run your program follow these steps..
 - put your hex code in `program/test.txt`
 - change directory to test sub-folder
 - run this cmd `$ iverilog -o cpu_test cpu_test.v`
 - `$ vvp cpu_test`
 - to look at its wave run this `$ gtkwave cpu.vcd`

#AUTHOR
[Ehab AlBadawy](mailto:ehalbadawy93@gmail.com)

#COPYRIGHT
Copyright © 2014, Ehab AlBadawy. All Rights Reserved.
This project is free software and released under [The MIT License](https://github.com/ehab93/MIPS-Processor/blob/master/LICENSE).
 
