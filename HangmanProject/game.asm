TITLE MY_PROJECT (test.asm)
INCLUDE Irvine32.inc

.data
H1 BYTE "			()    ()  ()()()  ()    ()  ()()()    ()      ()   ()()   ()    ()",0
H2 BYTE "			()    () ()    () ()()  () ()         ()()  ()() ()    () ()()  ()",0
H3 BYTE "			()()()() ()()()() () () () ()  ()()() ()  ()  () ()()()() () () ()",0
H4 BYTE "			()    () ()    () ()  ()() ()  ()  () ()      () ()    () ()  ()()",0
H5 BYTE "			()    () ()    () ()    ()  ()()   () ()      () ()    () ()    ()",0


H6 BYTE "			              ()()()       ()()    ()      ()  ()()()()",0
H7 BYTE "			             ()          ()    ()  ()()  ()()  ()      ",0
H8 BYTE "			             ()  ()()()  ()()()()  ()  ()  ()  ()()()()",0
H9 BYTE "			             ()  ()  ()  ()    ()  ()      ()  ()      ",0
H10 BYTE "			              ()()   ()  ()    ()  ()      ()  ()()()()",0

MEM BYTE "    GROUP MEMBERS:",0
MEM1 BYTE "SAAD HUSSAIN (23k-0705)",0
MEM2 BYTE "SYED FARHAN ALI (23k-0862)",0
MEM3 BYTE "MUHAMMAD IBTESAM (23k-0738)",0
var BYTE 15
S1 BYTE "________",0
S2 BYTE "|",0
S3 BYTE "@",0
S4 BYTE "/ \",0
S5 BYTE " ______|_______",0
S6 BYTE "|______________|",0

Hangman BYTE '@','/','|','\','/','\'
var1 BYTE 1 

msg BYTE "PRESS ANY KEY TO CONTINUE.... ",0
msg1 BYTE "MENU:",0
msg2 BYTE "1) PLAY GAME",0
msg3 BYTE "2) VIEW HIGHSCORE",0
msg4 BYTE "3) HELP/HOW TO PLAY",0
msg5 BYTE "4) QUIT",0
msg6 BYTE "ENTER YOUR CHOICE: ",0
msg7 BYTE "Invalid Input, please run the program again..",0
msg8 BYTE "THANKYOU FOR PLAYING, STAY BRIGHT!",0
msg9 BYTE "Correct Word",0

ARRAY6 BYTE "ORANGE",0, "FAMILY",0, "SILVER",0, "DONATE",0, "MONDAY",0, "NATURE",0, "BROKEN",0, "RACHEL",0, "FRIDAY",0, "FATHER", 0
ARRAY7 BYTE "JASMINE",0, "OSTRICH",0, "CHAPTER",0, "CRYSTAL",0, "DEPOSIT",0, "HOLIDAY",0, "CALIBER",0, "KITCHEN", 0,"KINGDOM",0, "ACQUIRE", 0
ARRAY8 BYTE "DINOSAUR",0,"PROVIDES",0,"DYNAMICS",0,"PRODUCES",0,"ALPHABET",0,"UNDERWAY",0,"UNIFORMS",0,"UNIQUELY",0,"THURSDAY",0,"ANTIHERO",0
ARRAY9 BYTE "DANGEROUS",0, "MASCULINE",0, "SOMETHING",0, "KNOWLEDGE",0, "WRESTLING",0, "WONDERFUL", 0, "EDUCATION",0, "CELEBRATE",0, "ALONGSIDE",0, "COMPANIES", 0
vowel byte "AEIOU",0
Underscore byte "_ ", 0
space byte " ",0

TRIALS DWORD 6 DUP(?)
value dword ?
value2 dword ?
len dword ?
wordtowork byte 9 dup (?)
RightGuessed dword 0
DUPLICATE BYTE " Has been entered earlier. No repeated entries are allowed!",0

Guessed byte 9 dup (?)
WrongGuessed byte 6 dup (?)
WrongCount dword 0

input byte ?
PROMPT BYTE "Enter your guess: ",0
PROMPTWIN BYTE "CONGRATULATIONS, YOU WON!",0
PROMPTLOOSE BYTE "BETTER LUCK NEXT TIME, CHAMP!",0


hsprompt byte "YOUR SCORE IS: ",0
score dword ?

intr byte "Welcome to Hangman game!",0
i1 byte "The instrcutions are quite simple: ",0
i2 byte "This is a word guessing game. The user is required to enter his guessed character.",0
i22 byte "If the character is guessed right, it replaces the vacant blank, otherwise the hangman drawing proceeds a step further, indicating a wrong guess.",0
i3 byte "Please note that the maximum numbers of wrong choices input can be 6.",0
i4 byte "For the user's convinience, Some hints of characters would already be given.",0
i5 byte "Happy Guessing! :)",0

WrongGuessedPrompt byte "Wrong Guesses: ",0
WrongInputPrompt byte "YOU MADE A WRONG GUESS!",0
CHOICE BYTE ?

CharacterMatched BYTE "YOUR ENTERY MATCHED!",0

HighestScore byte "HIGHEST SCORE OF THIS GAME YET : ",0

filehandle DWORD ?
filename byte "highscore.txt",0
buffsize=3 
highscoreBuffer byte buffsize dup(0)

score2 dword 0
scoreArray byte 3 dup(0)

.code
main proc

call Display
call Menu

CMP CHOICE, 1
JE FirstOption
CMP CHOICE, 2
JE SecondOption
CMP CHOICE, 3
JE ThirdOption
CMP CHOICE, 4
JE FourthOption
JMP InvalidInput

FirstOption:
	call clrscr
	call startgame
	jmp outside
SecondOption:
	call clrscr
	call HIGHSCORES
	jmp outside
ThirdOption:
	call clrscr
	call INSTRUCTIONS
	jmp outside
FourthOption:
	call clrscr
	mov edx, offset msg8
	call writeString
	jmp outside
InvalidInput:
	mov edx, offset msg7
	call WriteString
outside:


exit
main endp


Display PROC
call crlf
mov edx,offset H1
call writestring
call crlf
mov edx,offset H2
call writestring
call crlf
mov edx,offset H3
call writestring
call crlf
mov edx,offset H4
call writestring
call crlf
mov edx,offset H5
call writestring

mov dh,7
mov dl,0
call gotoxy
mov edx,offset H6
call writestring
call crlf
mov edx,offset H7
call writestring
call crlf
mov edx,offset H8
call writestring
call crlf
mov edx,offset H9
call writestring
call crlf
mov edx,offset H10
call writestring


mov edx,0
mov dh,18
mov dl,45
call gotoxy
mov edx,offset MEM
call writestring
mov edx,0
mov dh,19
mov dl,45
call gotoxy
mov edx,offset MEM1
call writestring
mov edx,0
mov dh,20
mov dl,45
call gotoxy
mov edx,offset MEM2
call writestring
mov edx,0
mov dh,21
mov dl,45
call gotoxy
mov edx,offset MEM3
call writestring

mov edx,0
mov dh,14
mov dl,85
call gotoxy
mov edx,offset S1
call writestring
mov ecx,7
l1:
mov edx,0
mov dl,85
mov dh,var
call gotoxy
mov edx,offset S2
call writestring
inc var
loop l1

mov edx,0
mov dl,92
mov dh,15
call gotoxy
mov edx,offset S2
call writestring

mov edx,0
mov dl,92
mov dh,16
call gotoxy
mov edx,offset S3
call writestring

mov edx,0
mov dl,91
mov dh,17
call gotoxy
mov edx,offset S4
call writestring

mov edx,0
mov dl,92
mov dh,17
call gotoxy
mov edx,offset S2
call writestring

mov edx,0
mov dl,92
mov dh,18
call gotoxy
mov edx,offset S2
call writestring

mov edx,0
mov dl,91
mov dh,19
call gotoxy
mov edx,offset S4
call writestring
mov edx,0
mov dl,78
mov dh,22
call gotoxy
mov edx,offset S5
call writestring

mov edx,0
mov dl,78
mov dh,23
call gotoxy
mov edx,offset S6
call writestring

mov edx,0
mov dl,40
mov dh,25
call gotoxy
mov edx,offset msg
call writestring
call readChar
call clrscr
ret
Display ENDP

Menu PROC
mov edx,0
mov dh,5
mov dl,50
call gotoxy
mov edx,offset msg1
call writestring

mov edx,0
mov dh,7
mov dl,50
call gotoxy
mov edx,offset msg2
call writestring


mov edx,0
mov dh,8
mov dl,50
call gotoxy
mov edx,offset msg3
call writestring


mov edx,0
mov dh,9
mov dl,50
call gotoxy
mov edx,offset msg4
call writestring

mov edx,0
mov dh,10
mov dl,50
call gotoxy
mov edx,offset msg5
call writestring

mov edx,0
mov dh,12
mov dl,45
call gotoxy
mov edx,offset msg6
call writestring
CALL READINT
MOV CHOICE, AL

ret
Menu ENDP


INSTRUCTIONS PROC
mov edx,offset intr
call writestring
call crlf
call crlf
mov edx,offset i1
call writestring
call crlf
call crlf
mov edx,offset i2
call writestring
call crlf
call crlf

mov edx,offset i22
call writestring
call crlf
call crlf

mov edx,offset i3
call writestring
call crlf
call crlf

mov edx,offset i4
call writestring
call crlf
call crlf

mov edx,offset i5
call writestring
call crlf
call crlf
RET
INSTRUCTIONS ENDP


; highscore function
CheckHighscore PROC
mov dl, byte ptr wrongcount
mov bl,10
mov al,06h
sub al,dl
mov dl,0
mul bl
mov ecx,0
mov cx,ax
mov edx,0
mov ax, word ptr len
mov bx,10
mul bx
add ax,cx
movzx ebx,ax
mov score,ebx
cmp wrongcount,6
JNE l1
mov score,0
l1:



; reading from a file
mov edx, offset filename
call OpenInputFile
mov filehandle, eax
mov edx, offset highscoreBuffer
mov ecx, buffsize
call ReadFromFile
mov eax, filehandle
call closeFile

mov esi, offset highscoreBuffer
mov ecx, sizeof highscoreBuffer

l3: mov eax, 0
	mov bl, 48
	sub [esi], bl
	inc esi
loop l3

mov esi, 0
mov eax, score2

l2: cmp esi, 3
	JE outside2
	mov edx, 0 
	mov cl, 10
	mul cl
	movzx ebx, [highscoreBuffer+esi]
	add eax, ebx
	inc esi
jmp l2


outside2:
	mov score2, eax
	
	mov eax, score
	cmp eax, score2
	JLE NoUpdateInScore

mov esi, 2
mov eax, score
ll1: cmp eax, 0
	JE outside
	mov edx, 0
	mov cx,10
	div cx
	add dl, 48 ;
	mov [scoreArray+esi], dl
	dec esi
jmp ll1


outside:
	mov al, [scoreArray]
	cmp al, 0
	JNE nexttt
	mov bl, 48
	add [scoreArray],bl

	nexttt:

	mov esi, offset scoreArray
	mov ecx, lengthof scoreArray
	printing:
		mov eax, 0
		mov al, [esi]
		;sub al, 48
		;call writeDec
		inc esi
	loop printing

mov edx, offset filename
call CreateOutputFile
mov filehandle, eax

mov eax, filehandle
mov edx, offset scoreArray
mov ecx, sizeof scoreArray
call WriteToFile
mov eax, filehandle
call closeFile

NoUpdateInScore:

RET
CheckHighscore ENDP


; main procedure

startgame proc
; generating value for number of array (1-4)
call randomize
mov eax,4
call randomrange
mov value,eax

; generating value for number of word (1-10)
call randomize
mov eax,10
call randomrange
mov value2, eax

mov eax, value
cmp value,0
je six
cmp value,1
je seven
cmp value,2
je eight
cmp value,3
je nine

six:
	mov eax, 6h
	mov len, eax                ;length moved
	mov eax,value2             ; no of word to access
	mov edx, 0
	mov ebx, len
	inc ebx
	mul ebx                ; to access word

	mov esi,eax
	mov ebx, len
	mov ecx,len
	mov edi, 0

sixloop:
	mov bl, ARRAY6[ESI]
	mov wordtowork[EDI], bl
	inc esi
	inc edi
loop sixloop

;mov edx, offset wordtowork
jmp ex

seven:
	mov eax, 7h
	mov len, eax
	mov eax,value2
	mov edx, 0
	mov ebx, len
	inc ebx
	mul ebx               ; to access word

	mov esi,eax
	mov ebx, len
	mov ecx,len
	mov edi, 0
sevenloop:
	mov bl, ARRAY7[ESI]
	mov wordtowork[edi], bl
	inc esi
	inc edi
loop sevenloop

jmp ex

eight:
	mov eax, 8h
	mov len, eax
	mov eax,value2
	mov edx, 0
	mov ebx, len
	inc ebx
	mul ebx             ; to access word

	mov esi,eax
	mov ebx, len
	mov ecx,len
	mov edi, 0

eightloop:
	mov bl, ARRAY8[ESI]
	mov wordtowork[edi], bl
	inc esi
	inc edi
loop eightloop
jmp ex

nine:
	mov eax, 9h
	mov len, eax
	mov eax,value2
	mov edx, 0
	mov ebx, len
	inc ebx
	mul ebx             ; to access word

	mov esi,eax
	mov ebx, len
	mov ecx,len
	mov edi, 0

NineLoop:
	mov bl, ARRAY9[ESI]
	mov wordtowork[edi], bl
	inc esi
	inc edi
loop NineLoop
jmp ex

ex:                              ;word has been saved at word to work. now we will print all vovels.


call PrintHint
callingLoop:
	call CallingFunction

	mov eax, len
	cmp RightGuessed, eax
	JE WIN
	mov ebx, 6
	cmp WrongCount, ebx
	JE LOOSE

	Mov edx, offset MSG
	call writeString
	call readChar

	CALL CLRSCR
jmp callingLoop

WIN:
	Mov edx, offset MSG
	call writeString
	call readChar

	call clrscr
	call DisplayHangman
	MOV dh, 10
	Mov dl, 20
	call gotoxy

	Mov edx, offset PromptWin
	call writeString
	jmp outsside

LOOSE:
	Mov edx, offset MSG
	call writeString
	call readChar

	call clrscr
	call DisplayHangman
	MOV dh, 10
	Mov dl, 20
	call gotoxy

	mov edx, offset PromptLoose
	call writeString
	
 outsside:
	call checkhighscore
	
	MOV dh, 11
	Mov dl, 25
	call gotoxy

	mov edx, offset hsprompt
	call writestring
	MOV EAX, SCORE
	call writedec
	
	cmp SCORE,0
	JNE out_ 
	mov ebx,offset msg9
	mov edx,offset wordtowork
	call msgbox

	out_:
	MOV DH, 25
	MOV DL, 2
	CALL GOTOXY

ret
startgame endp



CallingFunction proc
	call DisplayHangman
	call Printguessed
	call InputCharacters
	RET
CallingFunction endp


Printguessed proc
mov dh,12
mov dl,2
call gotoxy
mov ecx, len
mov esi, 0
lo:
	mov al, Guessed[esi]
	call writeChar
	mov edx, offset space
	call writeString
	inc esi
loop lo
ret
Printguessed endp

PrintHint proc

mov dh,12
mov dl,2
call gotoxy
mov ecx, len
mov esi, 0
printing1:
	mov eax, 0
	mov ebx, ecx
	mov edi, offset vowel
	mov ecx, lengthof vowel-1
	printing2:
		mov al, [edi]
		cmp wordToWork[esi], al
		JE outt
		inc edi
	LOOP printing2

	mov edx,offset underscore
	call writeString
	mov al, underscore
	mov Guessed[esi], al

	mov al, Guessed[esi]

	jmp next

	outt:                       ; printing vowel and storing it as right guess to prevent user from guessing it.
		call WriteChar
		mov edx, offset space
		call writeString
		mov Guessed[esi], al
		inc RightGuessed

	next:
		mov ecx, ebx
		inc esi
loop printing1

ret
PrintHint ENDP


InputCharacters proc

mov dh,14
mov dl,2
call gotoxy
mov edx, offset PROMPT
call writeString
call ReadChar
mov input, al
call WriteChar

MOV ECX,LEN
MOV ESI,0

CHECK:
	MOV BH,GUESSED[ESI]
	CMP BH,AL
	JNE DUPLICATIONNOTFOUND
	
	mov dh, 15
	mov dl, 2
	call gotoxy
	call WriteChar
	MOV EDX, OFFSET DUPLICATE
	call WRITESTRING
	;dec RightGuessed 
	jmp next
	
	DUPLICATIONNOTFOUND:
		MOV BH,WRONGGUESSED[ESI]
		CMP BH,AL
		JNE CONTINUEE
		mov dh, 15
		mov dl, 2
		call gotoxy
		CALL WRITECHAR
		MOV EDX, OFFSET DUPLICATE
		CALL WRITESTRING
		;dec WrongCount
		jmp next
	CONTINUEE:
		Inc esi
loop check

NODUPS:
	mov edi, offset WordToWork
	mov al, input

	mov ecx, len
	cld
	repne scasb
	jnz quit		; wrong me move krwa do input ko ab
	dec edi

	mov eax, len
	sub eax, ecx

	mov esi, eax
	mov al, input
	dec esi
	mov Guessed[esi], al
	inc RightGuessed

	mov dh, 16
	mov dl, 2
	call gotoxy
	mov edx, offset CharacterMatched
	call WriteString

	jmp next

; wrong guess ke array me store krwaein gein later
quit:
	mov al, input
	mov esi, WrongCount
	mov WrongGuessed[esi], al
	inc WrongCount

	mov ecx, WrongCount
	mov eax, 0
	mov esi, 0

	mov dh, 16
	mov dl, 2
	call gotoxy
	mov edx, offset WrongInputPrompt
	call WriteString

	mov dh, 17
	mov dl, 2
	call gotoxy
	
	mov edx, offset WrongGuessedPrompt
	call WriteString

DisplayWrongGuesses:
	mov al, WrongGuessed[esi]
	call WriteChar
	mov edx, offset space
	call writeString
	inc esi
loop DisplayWrongGuesses

next:
	mov dh, 20
	mov dl, 2
	call gotoxy

ret
InputCharacters endp



DisplayHangman proc

mov edx,0
mov dh,0;11
mov dl,34
call gotoxy
mov edx,offset S1
call writestring
mov dh,1;12
mov dl,41
call gotoxy
mov edx,offset S2
call writestring
mov ecx,5
l1:
	mov edx,0
	mov dl,34
	mov dh,var1
	call gotoxy
	mov edx,offset S2
	call writestring
	inc var1
loop l1

mov al,1
mov var1,al

mov edx,0
mov dl,27
mov dh,17-11;
call gotoxy
mov edx,offset S5
call writestring

mov edx,0
mov dl,27
mov dh,7;18
call gotoxy
mov edx,offset S6
call writestring

mov esi,0
mov edx,0
mov dh,2;13
mov dl,40
mov eax,lengthof Hangman
sub eax,wrongcount
mov ecx,eax
cmp wrongcount,6
JE ex

hang: 
	mov al,Hangman[esi]
	cmp esi,1
	JE goto1
g1:
	cmp esi,4
	JE goto2
g2:
	inc esi
	inc dl
	cmp esi,lengthof Hangman
JE goto3
g3:
	call gotoxy
	call writechar
loop hang

   jmp ex
goto1:
	mov dl,40-1
	inc dh
	jmp g1
goto2:
	mov dl,40-1
	inc dh
	jmp g2
goto3:
	inc dl
	jmp g3
	ex:
		mov edx,0
	ret
DisplayHangman endp



HIGHSCORES PROC

; reading from a file
mov edx, offset filename
call OpenInputFile
mov filehandle, eax
mov edx, offset highscoreBuffer
mov ecx, buffsize
call ReadFromFile
mov eax, filehandle
call closeFile

mov esi, offset highscoreBuffer
mov ecx, sizeof highscoreBuffer

l3: mov eax, 0
	mov bl, 48
	sub [esi], bl
	inc esi
loop l3

mov esi, 0
mov eax, score2

l2: cmp esi, 3
	JE outside2
	mov edx, 0 
	mov cl, 10
	mul cl
	movzx ebx, [highscoreBuffer+esi]
	add eax, ebx
	inc esi
jmp l2


outside2:
	mov dh, 2
	mov dl, 15
	call gotoxy

	mov edx, offset HighestScore
	call WriteString
	
	mov score2, eax
	mov eax, score2
	call writeDec
	call crlf

	mov dh, 15
	mov dl, 2
	call gotoxy
ret
HIGHSCORES ENDP
end main
