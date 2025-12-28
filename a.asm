section .data
    msg db "Hello, World!", 0xA  ; 定义字符串，0xA 是换行符 (\n)
    len equ $ - msg              ; 计算字符串长度

section .text
    global _start                ; 程序的入口点

_start:
    ; --- 使用 write 系统调用输出字符串 ---
    mov rax, 1          ; 系统调用号 1 是 sys_write
    mov rdi, 1          ; 文件描述符 1 是标准输出 (stdout)
    mov rsi, msg        ; 字符串的内存地址
    mov rdx, len        ; 字符串的长度
    syscall             ; 调用内核执行

    ; --- 使用 exit 系统调用退出程序 ---
    mov rax, 60         ; 系统调用号 60 是 sys_exit
    mov rdi, 0          ; 返回值 0 (表示成功)
    syscall             ; 调用内核执行