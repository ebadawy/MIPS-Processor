#MIPS-Processor

###:rocket: Microprocessor without Interlocked Pipeline Stages


MIPS is a reduced instruction set computer (RISC) instruction set (ISA) developed by MIPS Technologies
(formerly MIPS Computer Systems, Inc.), This repo is an implementation of the single-cycle	MIPS datapath
written in virelog.

###:game_die: supported instructions:

- **Arithmetic**: add, addi, sub
- **Load/Store**: lw, sw
- **Logic**: and, andi, or, ori, nor
- **Control flow**: beq, bne, jal, jr, j
- **Comparison**: slt

This repo also contains test benches for differnt instructions types and modules, I'll discribe how to run them
in the following sections.

##Getting Started


You need a smiulator to run the code, To inatall [Icarus](http://iverilog.icarus.com/) (**recommended**) in differnent patforms, follow steps on this 
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


###:nut_and_bolt: Directores Structure:
 - **Test**: Contains test benches for all modules
 - **program**: Contains test for different instructions types and the main program in test.txt file.
 - **synthesis**: Contains the synthesis script to synthesis the project using [yosys](http://www.clifford.at/yosys/about.html).
 - **lib**: Contains the common module that is used in other different modules.
 - **Rest of dirs**: Each contains its module.
 
###:nut_and_bolt: Code Structure:
  most of the code is designed in bothe structural and behavioral style, however instructiom and data memory
  is designed in the behavioral code style.
  
  Each module of the mips processor is under its own directory and they are all included in cpu file.
  
  - **ALU**: the ALU unite is cascaded from 32 one_bit_alu 
  - **im**: Instruction memory is woard addressable, It's initialized using `$readmemh` verilog operation,
  The default text file is `program/test.txt` , Maximux number of instructions that it could contain is 255. 
  - **dm**: Data memory is 32 bit with 256 entries, In the positive edge of the clock when the memWrite signal is 1
  , Tht input data is writen in the address given from the ALU, otherwise the memRead signal is 1 and the output data
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
I type instruction , `-DBRANCH` for branch instruction, `-DBRANCHN` for bne instruction , `-DJUMP` for j instruction
, `-DJAL` for jal instruction or it could be left unspacified and the `program/test.txt` file will be loaded.



 

