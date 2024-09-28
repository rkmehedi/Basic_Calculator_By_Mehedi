# Basic_Calculator_By_Mehedi
Basic_Calculator_By_Mehedi_for_CUB_Assignments
Basic Calculator in EMU8086 Assembly Language
Description:

This project is a simple calculator program written in 8086 Assembly Language. It allows users to perform basic arithmetic operations such as Addition, Subtraction, Multiplication, and Division using an 8-bit processor. The calculator takes two input digits (ranging from 0 to 9), performs the selected operation, and displays the result with a custom message. This project is built specifically for educational purposes and microprocessor lab exercises.

The project is structured to simulate a command-line interface where users can input their numbers and operations, with output messages indicating the results and providing user-friendly prompts.
Features:

    Supports the following arithmetic operations:
      1.Addition
      2.Subtraction
      3.Multiplication
      4.Division (with error handling for division by zero)
    Customizable prompts that guide the user through each step.
    Automatic result display after each operation.
    Displays a "Thank you" message and personal information after each calculation.
    Error handling for invalid input and division by zero.

Table of Contents

    1.Features
    2.Setup Instructions
    3.Usage
    4.Source Code Explanation
    5.License

Setup Instructions
Requirements:

    EMU8086 or any other 8086 microprocessor simulator.

Steps:

    Download or clone this repository:

    bash

    git clone https://github.com/rkmehedi/Basic_Calculator_By_Mehedi.git

    Open the source code file (Basic_Calculator_By_Mehedi.asm) in EMU8086.
    Assemble and run the program to simulate the calculator.

Usage:

    Upon running the program, the user will see the title and a menu of operations.
    The user will select the operation they want by entering the corresponding number.
    After selecting the operation, the user will be prompted to enter the first and second digits (ranging from 0 to 9).
    The program will display the result with a message indicating the operation performed.
    After the result, a thank-you message and user information will be displayed.

Source Code Explanation:
Libraries and Logic Used:

This program primarily utilizes MS-DOS interrupt 21h for handling input and output functions. Below is a brief explanation of key interrupts used:

    INT 21h with AH=09h: Used to display a string to the console.
    INT 21h with AH=01h: Used to get a single character of input from the user.

The logic of the program is centered around the comparison (CMP) and arithmetic operations (ADD, SUB, MUL, DIV) to perform the calculations.
Structure:

    The program starts by initializing the data segment to store various messages and inputs.
    The control flow is guided using conditional jumps (JE, JMP), directing the program to the correct operations based on user input.
    After each calculation, the result is displayed, followed by a thank-you message and user information.

License

This project is licensed under the MIT License.
