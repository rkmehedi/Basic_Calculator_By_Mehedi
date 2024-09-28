
.MODEL SMALL
.STACK 100H
.DATA
    msgTitle db 0Dh, 0Ah, 0Dh, 0Ah, '*** Basic Calculator in EMU8086 Assembly Language ***', 0Dh, 0Ah, 0Dh, 0Ah, 'For Rajesh Sir by MEHEDI HASSAH ID 23305017$', 0
    msgSelect db 0Dh, 0Ah, 0Dh, 0Ah, 'Select which operation you want to do:', 0Dh, 0Ah, '1-Addition', 0Dh, 0Ah, '2-Subtraction', 0Dh, 0Ah, '3-Multiplication', 0Dh, 0Ah, '4-Division$', 0
    msgPleaseSelect db 0Dh, 0Ah, 'Please select which one you want to do: $'
    msgFirstAdd db 0Dh, 0Ah, 0Dh, 0Ah, 'Enter first digit (0-9) for Addition: $'
    msgFirstSub db 0Dh, 0Ah, 0Dh, 0Ah, 'Enter first digit (0-9) for Subtraction: $'
    msgFirstMul db 0Dh, 0Ah, 0Dh, 0Ah, 'Enter first digit (0-9) for Multiplication: $'
    msgFirstDiv db 0Dh, 0Ah, 0Dh, 0Ah, 'Enter first digit (0-9) for Division: $'
    msgSecondAdd db 0Dh, 0Ah, 0Dh, 0Ah, 'Enter second digit (0-9) for Addition: $'
    msgSecondSub db 0Dh, 0Ah, 0Dh, 0Ah, 'Enter second digit (0-9) for Subtraction: $'
    msgSecondMul db 0Dh, 0Ah, 0Dh, 0Ah, 'Enter second digit (0-9) for Multiplication: $'
    msgSecondDiv db 0Dh, 0Ah, 0Dh, 0Ah, 'Enter second digit (0-9) for Division: $'
    msgResultAdd db 0Dh, 0Ah, 0Dh, 0Ah, 'The final result is after Addition operation: $'
    msgResultSub db 0Dh, 0Ah, 0Dh, 0Ah, 'The final result is after Subtraction operation: $'
    msgResultMul db 0Dh, 0Ah, 0Dh, 0Ah, 'The final result is after Multiplication operation: $'
    msgResultDiv db 0Dh, 0Ah, 0Dh, 0Ah, 'The final result is after Division operation: $'
    msgThankYou db 0Dh, 0Ah, 0Dh, 0Ah, 'Thank you for using Mehedi''s basic calculator for CUB.$', 0
    msgMyInfo db 0Dh, 0Ah, 0Dh, 0Ah, 0Dh, 0Ah, 'My information:', 0Dh, 0Ah, '$'
    msgInfo db 0Dh, 0Ah, 'Name: MEHEDI HASSAH', 0Dh, 0Ah, 'Student ID: 23305017', 0Dh, 0Ah, 'Subject: Microprocessor Lab', 0Dh, 0Ah, 'Teacher: Rajesh Majumdar', 0Dh, 0Ah, 'University: Canadian University of Bangladesh$', 0
    errorDiv db 0Dh, 0Ah, 0Dh, 0Ah, 'Error: Division by zero is not allowed$', 0
    result db ? ; for storing the result
    newline db 0Dh, 0Ah, 0Dh, 0Ah, '$'

.CODE
START:
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display the title
    LEA DX, msgTitle
    MOV AH, 09H
    INT 21H

    ; Show Operation Selection Message
    LEA DX, msgSelect
    MOV AH, 09H
    INT 21H

    ; Ask for operation selection
    LEA DX, msgPleaseSelect
    MOV AH, 09H
    INT 21H

    ; Get operation choice
    MOV AH, 01H
    INT 21H
    SUB AL, '0' ; Convert ASCII to number (1, 2, 3, 4)
    MOV BL, AL  ; Store operation choice in BL

    ; Display appropriate first number prompt based on operation
    CMP BL, 1
    JE ADDITION_PROMPT
    CMP BL, 2
    JE SUBTRACTION_PROMPT
    CMP BL, 3
    JE MULTIPLICATION_PROMPT
    CMP BL, 4
    JE DIVISION_PROMPT
    JMP EXIT

ADDITION_PROMPT:
    LEA DX, msgFirstAdd
    JMP GET_FIRST_NUMBER

SUBTRACTION_PROMPT:
    LEA DX, msgFirstSub
    JMP GET_FIRST_NUMBER

MULTIPLICATION_PROMPT:
    LEA DX, msgFirstMul
    JMP GET_FIRST_NUMBER

DIVISION_PROMPT:
    LEA DX, msgFirstDiv

GET_FIRST_NUMBER:
    MOV AH, 09H
    INT 21H ; Display the prompt

    ; Auto-entering first digit
    MOV AH, 01H
    INT 21H ; Read first digit
    SUB AL, '0' ; Convert ASCII to number
    MOV CL, AL  ; Store first number in CL

    ; Display second number prompt based on operation
    CMP BL, 1
    JE SECOND_ADD_PROMPT
    CMP BL, 2
    JE SECOND_SUB_PROMPT
    CMP BL, 3
    JE SECOND_MUL_PROMPT
    CMP BL, 4
    JE SECOND_DIV_PROMPT
    JMP EXIT

SECOND_ADD_PROMPT:
    LEA DX, msgSecondAdd
    JMP GET_SECOND_NUMBER

SECOND_SUB_PROMPT:
    LEA DX, msgSecondSub
    JMP GET_SECOND_NUMBER

SECOND_MUL_PROMPT:
    LEA DX, msgSecondMul
    JMP GET_SECOND_NUMBER

SECOND_DIV_PROMPT:
    LEA DX, msgSecondDiv

GET_SECOND_NUMBER:
    MOV AH, 09H
    INT 21H ; Display the prompt

    ; Auto-entering second digit
    MOV AH, 01H
    INT 21H ; Read second digit
    SUB AL, '0' ; Convert ASCII to number
    MOV CH, AL  ; Store second number in CH

    ; Perform the selected operation
    CMP BL, 1
    JE ADDITION
    CMP BL, 2
    JE SUBTRACTION
    CMP BL, 3
    JE MULTIPLICATION
    CMP BL, 4
    JE DIVISION
    JMP EXIT

ADDITION:
    MOV AL, CL
    ADD AL, CH  ; Add the two numbers
    LEA DX, msgResultAdd
    JMP SHOW_RESULT

SUBTRACTION:
    MOV AL, CL
    SUB AL, CH  ; Subtract the two numbers
    LEA DX, msgResultSub
    JMP SHOW_RESULT

MULTIPLICATION:
    MOV AL, CL
    MOV BL, CH
    MUL BL  ; Multiply the two numbers
    LEA DX, msgResultMul
    JMP SHOW_RESULT

DIVISION:
    CMP CH, 0  ; Check for division by zero
    JE DIV_ZERO_ERROR
    MOV AL, CL
    MOV BL, CH
    ; Use CBW to sign extend AL for division
    CBW ; Convert byte to word
    DIV BL  ; Divide first number by second
    LEA DX, msgResultDiv
    JMP SHOW_RESULT

DIV_ZERO_ERROR:
    LEA DX, errorDiv
    MOV AH, 09H
    INT 21H
    JMP EXIT

SHOW_RESULT:
    ADD AL, '0'  ; Convert result to ASCII
    MOV result, AL

    ; Display result with operation name
    MOV AH, 09H
    INT 21H

    MOV DL, result
    MOV AH, 02H
    INT 21H

    ; Display thank you message
    LEA DX, newline
    MOV AH, 09H
    INT 21H

    LEA DX, msgThankYou
    MOV AH, 09H
    INT 21H

    ; Display "My information"
    LEA DX, msgMyInfo
    MOV AH, 09H
    INT 21H

    ; Display personal information
    LEA DX, msgInfo
    MOV AH, 09H
    INT 21H

EXIT:
    MOV AH, 4CH  ; Exit program
    INT 21H

END START
