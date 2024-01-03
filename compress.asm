section .data
    input_file  db 'input.txt', 0
    output_file db 'output.txt', 0

section .bss
    buffer resb 256

section .text
    global _start

_start:
    ; Open the input file
    mov eax, 5        
    mov ebx, input_file
    mov ecx, 0        ;O_RDONLY
    int 0x80

    ; Open the output file
    mov eax, 5     
    mov ebx, output_file
    mov ecx, 641     
    mov edx, 0644    
    int 0x80

    ; Main compression loop
    mov edx, 1        
    mov ecx, buffer   
    mov ebx, eax      

read_loop:
    mov eax, 3        
    int 0x80

    ; Check for end of file
    cmp eax, 0
    je  end_of_file

    ; Check if consecutive characters are the same
    mov al, [ecx]
    mov ah, [ecx + 1]
    cmp al, ah
    jne write_to_output

    ; Increment counter for consecutive characters
    inc edx
    jmp read_loop

write_to_output:
    ; Write the character and its count to the output file
    mov eax, 4        
    mov ebx, eax      
    mov ecx, buffer
    mov edx, 2       
    int 0x80

    ; Reset counter
    mov edx, 1

    ; Continue reading characters
    jmp read_loop

end_of_file:
    ; Close files
    mov eax, 6        
    int 0x80

    mov eax, 6        
    int 0x80

    ; Exit
    mov eax, 1        
    xor ebx, ebx  
    int 0x80

