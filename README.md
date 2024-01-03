# Assembly File Compression

## Overview

This repository contains a simple file compression program implemented in assembly language. The program utilizes the Run-Length Encoding (RLE) algorithm to compress consecutive repeated characters in a text file. It serves as an educational example for low-level programming and file manipulation in assembly.

## Features

-   Basic file compression using the RLE algorithm.
-   Reads input from `input.txt` and writes compressed output to `output.txt`.
-   Linux x86 architecture specific (adjustments may be needed for other platforms).

## Usage

1.  Clone the repository:
    
    `git clone https://github.com/DavidVardzelian/Run-Length-Encoding.git
    cd Run-Length-Encoding` 
    
2.  Compile the assembly code using NASM and link using LD:
    
    `nasm -f elf compress.asm -o compress.o
    ld compress.o -o compress` 
    
3.  Run the compiled executable to compress the `input.txt` file:
    
    `./compress` 
    
## License

This project is licensed under the MIT License.

## Disclaimer

This is a basic example for educational purposes. Consider additional features and improvements for production-level use.
