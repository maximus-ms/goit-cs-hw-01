org  0x100               ; Declare that this is a .COM program
section .data
    a db 5               ; Define a = 5
    b db 3               ; Define b = 3
    c db 2               ; Define c = 2
    resultMsg db 'Result: $' ; Define a string for printing result

section .text
_start:
    mov al, [b]          ; Load b into al
    sub al, [c]          ; Subtract c from al
    add al, [a]          ; Add a to al

    ; Converting result to ASCII character (for single-digit numbers)
    add al, 30h          ; Convert number to ASCII character

    ; Printing result
    mov ah, 09h          ; DOS function for printing string
    lea dx, resultMsg    ; Set DX to address of resultMsg
    int 21h              ; DOS-interrupt call

    ; Printing number
    mov dl, al           ; Put result into dl for printing
    mov ah, 02h          ; DOS function for printing character
    int 21h              ; DOS-interrupt call

    ; Terminating program
    mov ax, 4c00h        ; DOS function for terminating program
    int 21h              ; DOS-interrupt call
