org 0x01052000                        ; Virtual address of the new section.
bits 32

; code section.

; Important information about the code:
;
; The code needs to call some windows dll functions. The corresponding instructions
; for these calls in the code use a placeholder value of 0. The actual address must
; be fixed in a program like Ghidra, which will map the call address to the correct
; relocation.

; Important information for values upon entry:
;
; Upon entry, there will be two pointers on the stack for lpStartupInfo
; and lpProcessInformation. ESP here will be pointing at the return address.
; EAX will have a pointer to the working directory, which we also want to use.

PUSH       EBP
MOV        EBP, ESP

; Allocate space for our PROCESS_INFORMATION structure.
SUB        ESP, 4*4
; Allocate space for our STARTUPINFOA structure.
SUB        ESP, 17*4
; Allocate space for exit code.
SUB        ESP, 4
; Allocate space for local "fail" variable.
SUB        ESP, 4

; Save original register state.
PUSHAD

; Zero the memory of our structures and variables.
PUSH       EAX
LEA        EDI, [EBP - (4+17+1)*4]
MOV        ECX, 4+17+1
MOV        EAX, 0
CLD
REP STOSD
POP        EAX

; Set si.cb (size of the STARTUPINFOA structure).
LEA        EDI, [EBP - (4+17)*4]
MOV        DWORD [EDI], 17*4

; Address of our PROCESS_INFORMATION structure.
LEA        ESI, [EBP - 4*4]

; Address of our STARTUPINFOA structure.
LEA        EDX, [EBP - (4+17)*4]

; Call CreateProcessA on our custom script/executable. Python 3 must be present on the system and in PATH.
PUSH       ESI                        ; PROCESS_INFORMATION
PUSH       EDX                        ; lpStartupInfo
PUSH       EAX                        ; lpCurrentDirectory <path to LevelData>
PUSH       0x0
PUSH       0x30
PUSH       -0x1
PUSH       0x0
PUSH       0x0
PUSH       cmdline
PUSH       0x0
CALL       DWORD 0                     ; CreateProcessA ######## Patch this relocation with ghidra. ########

; Check if CreateProcessA failed.
TEST       EAX, EAX
JNZ        INJECTION_SUCCESS

PUSH       python_err_msg
CALL       ShowErrorMessage
LEA        EDI, [EBP - (4+17+1)*4]
MOV        DWORD [EDI], 1
JMP        START_ENGINE_OR_FAIL

INJECTION_SUCCESS:
; Call WaitForSingleObject and wait for process completion.
PUSH       DWORD -1                   ; INFINITE
PUSH       DWORD [ESI]                ; pi.hProcess
CALL       DWORD 0                    ; WaitForSingleObject ######## Patch this relocation with ghidra. ########

; Check if WaitForSingleObject itself failed.
CMP        EAX, 0                     ; WAIT_OBJECT_0 const (The state of the specified object is signaled.)
JNE        UNKNOWN_ERROR

; Call GetExitCodeThread.
LEA        EDI, [EBP - (4+17+1)*4]
PUSH       EDI                        ; lpExitCode
PUSH       DWORD [ESI + 4]            ; hThread
CALL       DWORD 0                    ; GetExitCodeThread ######## Patch this relocation with ghidra. ########

; Check if GetExitCodeThread itself failed.
TEST       EAX, EAX                   ; If the function succeeds, the return value is nonzero.
JZ         UNKNOWN_ERROR

; Finally check the real exit status.
CMP        DWORD [EDI], 0x103         ; STILL_ACTIVE 259/0x103
JE         INJECTION_SUCCESS          ; wait again.
CMP        DWORD [EDI], 0             ; Success exit code.
JE         CLOSE_HANDLES              ; mod.py exited successfully.

PUSH       script_error_msg
CALL       ShowErrorMessage
LEA        EDI, [EBP - (4+17+1)*4]
MOV        DWORD [EDI], 1
JMP        CLOSE_HANDLES

UNKNOWN_ERROR:
; Unknown errors are those where WaitForSingleObject or GetExitCodeProcess fail.
PUSH       unknown_error_msg
CALL       ShowErrorMessage
LEA        EDI, [EBP - (4+17+1)*4]
MOV        DWORD [EDI], 1

CLOSE_HANDLES:
; Close the handles. We don't error-check these.
PUSH       DWORD [ESI]
CALL       DWORD 0                    ; CloseHandle ######## Patch this relocation with ghidra. ########
PUSH       DWORD [ESI + 4]
CALL       DWORD 0                    ; CloseHandle ######## Patch this relocation with ghidra. ########

START_ENGINE_OR_FAIL:
MOV        EAX, [EBP - (4+17+1)*4]
TEST       EAX, EAX
JZ         START_ENGINE

; Fail

; Pop original state.
POPAD

; Deallocate stack space that we reserved earlier.
MOV        ESP, EBP
POP        EBP

; Simulate a failed CreateProcessA call.
MOV        EAX, 0
; Return, popping original values that were on the stack before entry.
RET 8

START_ENGINE:
; Pop original state.
POPAD

; Original acknex CreateProcessA call.
; Push original values that were on stack before this code was called.
MOV        EDX, [EBP + 3*4]
PUSH       EDX
MOV        EDX, [EBP + 2*4]
PUSH       EDX
; Push rest of parameters.
PUSH       EAX
PUSH       0x0
PUSH       0x30
PUSH       -0x1
PUSH       0x0
PUSH       0x0
PUSH       0x0
PUSH       EDI
CALL       DWORD 0                    ; CreateProcessA ######## Patch this relocation with ghidra. ########
; Important: EAX must be preserved for the original code.

; Deallocate stack space that we reserved earlier.
MOV        ESP, EBP
POP        EBP

; Return, popping original values that were on the stack before entry.
RET 8

; ShowErrorMessage proc. Using stdcall convention for convenience.
; ShowErrorMessage(char *error);
ShowErrorMessage:

; Unblock input so that user can close the message box.
PUSH       DWORD 0
CALL       DWORD 0                    ; BlockInput ######## Patch this relocation with ghidra. ########

MOV        EAX, [ESP + 4]
PUSH       0x52000                    ; uType, MB_OK | MB_ICONERROR | MB_TASKMODAL | MB_SETFOREGROUND | MB_TOPMOST
PUSH       0                          ; lpCaption, Error.
PUSH       EAX                        ; lpText
PUSH       0                          ; hWnd
CALL       DWORD 0                    ; MessageBoxA ######## Patch this relocation with ghidra. ########
RET 4

; data section.

; Using "py" for the python command because windows 10 has an alias for "python" and "python3" that would open the microsoft store.
cmdline                        db "py ..\mod.py", 0
python_err_msg                 db "Could not execute python. Make sure python 3 is installed and in PATH.", 0
unknown_error_msg              db "Encountered unknown error.", 0
script_error_msg               db "Could not execute mod.py. Make sure file exists then refer to mod.log for details.", 0
