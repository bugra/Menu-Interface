A Menu Interface  - Summer 2009
---
A menu interface connected UART serial port between computer and FPGA.  
Matlab directory includes the menu(string format) and `hexadecimal_character.m` file turns into this string formatted into hexadecimal representation format of ASCII characters. `text_file.txt` stores hexadecimal representation. For instance, it includes a considerable amount of `x"20"` which corresponds 32 in decimal, it represents space(`&#32` in html) in ASCII table.  
For VHDL part, this menu is stored in `ram_512x8.vhd` and read by `top_module.vhd`, prints into screen. It also takes input from keyboard and adjust the menu from user input.  
