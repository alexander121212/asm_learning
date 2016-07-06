.data
printf_format:
        .string "%d\n"

.text

.globl main


.type main, @function

main:
        pushq %rax                      /* ÁÇÍÎ, ÐÄÅÁÉ ÐÞÔ */
        pushq $printf_format            /* ÁÇÍÎ format */
        call  printf                    /* ×Ú×printf() */
        addq  $16, %rsp 
