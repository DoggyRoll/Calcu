;An example assembly language program               SAMPLE.ASM
;
;         Objective: To demonstrate the use of some I/O
;                    routines and to show the structure
;                    of assembly language programs.
;            Inputs: As prompted.
;           Outputs: As per input.
%include  "io.mac"

.DATA

inicio         	 db   'Ingrese una expresion: ',0
continuar?		 db   'Desea ingresar otra expresion? (y/n): ',0

EsBinario        db   'Es Binario',0
EsOctal  	  	 db   'Es Octal',0
EsHexadecimal 	 db   'Es Hexadecimal',0 
EsDecimal	  	 db   'Es Decimal',0

inputErrorBin    db   'Numero Binario Incorrecto',0
inputErrorOct	 db	  'Numero Octal Incorrecto',0
inputErrorHex	 db	  'Numero Hexadecimal Incorrecto',0
inputErrorDec	 db	  'Numero Decimal Incorrecto',0
malaCifra		 db   'Cifra Incorrecta',0
divCero			 db   'Error: Division por Cero.. Explotó el Mundo :c',0

resBin			 db	  'Resultado en Binario: ',0
resOct			 db	  'Resultado en Octal: ',0
resHex			 db	  'Resultado en Hexadecimal: ',0

sacandoTodo		 db	  'sacando todo',0

print2			 db	  'print',0

print3			 db	  'skip',0

suma			 db	  'suma',0
resta			 db	  'resta',0
multiplicacion   db   'multiplicacion',0
division		 db   'division',0
ParDer		     db	  'parentesis derecho',0
ParIzq 			 db	  'parentesis izquierdo',0

expresionPrint   db	  'expresion = ',0
cxEquals		 db	  'CX = ',0
cxEqualsAgain    db   'CX == ',0
whileReading     db   ' while reading: ',0
casoGuaba		 db	  'caso guaba... ',0
final			 db   'final',0
revisandoPila    db   'Revisando Pila',0
volviendoAMeter  db   'Volviendo a meter: ',0
cicloLecturaP	 db   ';==== CICLO LECTURA ====;',0
finalPostfija    db   'Postfija Final:',0

sumando			 db   'sumando.. ',0
restando		 db   'restando.. ',0
multiplicando    db   'multiplicando.. ',0
dividiendo		 db	  'dividiendo.. ',0

EsNumero		 db   'Es Numero',0
moviendo		 db   'Moviendo este Caracter a entero: ',0
numeroListo		 db   'Numero Listo: ',0
guardandoPeticion db  'Guardando Peticion..',0
notDoneYet		 db	  'Not Done Yet',0

ingreseComp		 db   'Ingrese un numero en cualquier base:',0
plus1			 db   '______________________________+1',0
negado1			 db	  '			|        |',0
negado2			 db	  '			V NEGADO V',0

datos1			 db	  'Andres Arraiga 2016081857,Gerald Morales 2016042404',0
datos2			 db	  'I Semestre,Prof. Esteban Arias M.',0
datos3			 db   'Arquitectura de Computadoras',0
datos4			 db   '2017,Ingenieria en Computacion,TEC I Semestre',0

menu1			 db   '{=================== Bienvenido a la Calculadora Multibase ===================}',0

menu2			 db   'Ingrese un digito para un modo:',0

menu3			 db   '1. Calcular Expresion',0
menu4			 db   '2. Complemento a base 2',0
menu5			 db   '3. Comandos',0

ayuda1			 db	  '#ayuda: Brinda un texto explicando las operaciones implementadas en la calculadora y un mini manual que explica el uso general de la calculadora.',0
ayuda2			 db   '#procedimiento: Para encender o apagar el modo de operación de la calculadora',0
ayuda3			 db   '#salir: Terminar el programa.',0


.UDATA

reg			 resb  1			  ; actua como registro dado el poco numero de estos para hacer calculos y movs	

buffer		 resb  32			  ; buffer universal de entrada

entero    	 resb  32             ; buffer para todo numero

offsetPostfijo		 resb  4			  ; offset para agarrar numeros en la expresion postfija
offsetEntero		 resb  4			  ; offset para meter digitos en variable entero 

expresion	 resb  64			  ; Array que guarda el orden postfijo de la expresion ingresada

solicitudResultado resb 1

complementoOn	resb	1			; Indicador que se esta calculando el complemento
complementoInv  resb	1			; Indicador que se esta calculando complemento de un numero negativo

marca		 resb  1
numero0		 resb  4
numero1      resb  4
numero2      resb  4
numero3      resb  4
numero4      resb  4
numero5      resb  4
numero6      resb  4
numero7      resb  4
numero8      resb  4
numero9      resb  4
numero10     resb  4
numero11     resb  4
numero12     resb  4
numero13     resb  4
numero14     resb  4
numero15     resb  4
numero16     resb  4
numero17     resb  4
numero18     resb  4
numero19     resb  4
numero20     resb  4

.CODE
     .STARTUP
     
menu:
	mov		ESI,buffer
	mov		[ESI],byte 0
	mov		[ESI+1],byte 0
	mov		[ESI+2],byte 0
	mov		[ESI+3],byte 0
	mov		[ESI+4],byte 0
	mov		[ESI+5],byte 0
	mov		[ESI+6],byte 0
	mov		[ESI+7],byte 0
	mov		[ESI+8],byte 0
	mov		[ESI+9],byte 0
	mov		[ESI+10],byte 0
	mov		[ESI+11],byte 0
	mov		[ESI+12],byte 0
	mov		[ESI+13],byte 0
	mov		[ESI+14],byte 0
	mov		[ESI+15],byte 0
	mov		[ESI+16],byte 0
	mov		[ESI+17],byte 0
	mov		[ESI+18],byte 0
	mov		[ESI+19],byte 0
	mov		[ESI+20],byte 0
	mov		[ESI+21],byte 0
	mov		[ESI+22],byte 0
	mov		[ESI+23],byte 0
	mov		[ESI+24],byte 0
	mov		[ESI+25],byte 0
	mov		[ESI+26],byte 0
	mov		[ESI+27],byte 0
	mov		[ESI+28],byte 0
	mov		[ESI+29],byte 0
	mov		[ESI+30],byte 0
	mov		[ESI+31],byte 0	
	PutStr		menu1
	nwln
	nwln
	PutStr		menu2
	nwln
	nwln
	PutStr		menu3
	nwln
	PutStr		menu4
	nwln
	PutStr		menu5
	nwln
	nwln
	GetCh		al
	cmp			al,'1'
	je			leerLinea
	cmp			al,'2'
	je			calcularComplemento
	cmp			al,'3'
	je			comandosMenu
	jmp			menu

;				PARA LEER EXPRESION DE ENTRADA Y FORMAR EXPRESION POSTFIJA
;
;	EAX			Recorre el string de entrada y tiene los caracteres de la misma
;	EBX			Offset para armar la variable de expresion
;	CX			Contador de elementos en la pila
;	DX			Maneja los push y pop de la pila

;	buffer  	Contiene la expresion de entrada
;	expresion	Variable destino que se ira armando la expresion postfija
;

;===============; LEER EXPRESION DE ENTRADA Y FORMAR EXPRESION POSTFIJA ;================;

comandosMenu:
leerLinea:	
		mov 	[complementoOn],byte 0
		xor		EAX,EAX
		xor		EBX,EBX
		xor		ECX,ECX
		xor		EDX,EDX	
		mov		ESI,expresion
		mov		[ESI],byte 0
		mov		[ESI+1],byte 0
		mov		[ESI+2],byte 0
		mov		[ESI+3],byte 0
		mov		[ESI+4],byte 0
		mov		[ESI+5],byte 0
		mov		[ESI+6],byte 0
		mov		[ESI+7],byte 0
		mov		[ESI+8],byte 0
		mov		[ESI+9],byte 0
		mov		[ESI+10],byte 0
		mov		[ESI+11],byte 0
		mov		[ESI+12],byte 0
		mov		[ESI+13],byte 0
		mov		[ESI+14],byte 0
		mov		[ESI+15],byte 0
		mov		[ESI+16],byte 0
		mov		[ESI+17],byte 0
		mov		[ESI+18],byte 0
		mov		[ESI+19],byte 0
		mov		[ESI+20],byte 0
		mov		[ESI+21],byte 0
		mov		[ESI+22],byte 0
		mov		[ESI+23],byte 0
		mov		[ESI+24],byte 0
		mov		[ESI+25],byte 0
		mov		[ESI+26],byte 0
		mov		[ESI+27],byte 0
		mov		[ESI+28],byte 0
		mov		[ESI+29],byte 0
		mov		[ESI+30],byte 0
		mov		[ESI+31],byte 0		
		
		mov 	[solicitudResultado],byte 0
		
		PutStr	inicio			; inicio
		nwln
		GetStr  buffer			; Guardo la expresion de entrada en buffer
		mov		EAX,buffer		; Copio buffer al EAX para leer la expresion
		mov		EBX,0			; Contiene el offset de expresion para ir armando la expresion postfija
		mov		CX,0			; Para mostrar la pila al final
		
		cmp		byte[EAX],'~'	; Calcular el complemento a base 2
		je		calcularComplemento
		jmp		cicloLectura
calcularComplemento:
		mov		ESI,entero
		mov		[ESI+0],byte 0
		mov		[ESI+1],byte 0
		mov		[ESI+2],byte 0
		mov		[ESI+3],byte 0
		mov		[ESI+4],byte 0
		mov		[ESI+5],byte 0
		mov		[ESI+6],byte 0
		mov		[ESI+7],byte 0
		mov		[ESI+8],byte 0
		mov		[ESI+9],byte 0
		mov		[ESI+10],byte 0
		mov		[ESI+11],byte 0
		mov		[ESI+12],byte 0
		mov		[ESI+13],byte 0
		mov		[ESI+14],byte 0
		mov		[ESI+15],byte 0
		mov		[ESI+16],byte 0
		mov		[ESI+17],byte 0
		mov		[ESI+18],byte 0
		mov		[ESI+19],byte 0
		mov		[ESI+20],byte 0
		mov		[ESI+21],byte 0
		mov		[ESI+22],byte 0
		mov		[ESI+23],byte 0
		mov		[ESI+24],byte 0
		mov		[ESI+25],byte 0
		mov		[ESI+26],byte 0
		mov		[ESI+27],byte 0
		mov		[ESI+28],byte 0
		mov		[ESI+29],byte 0
		mov		[ESI+30],byte 0
		mov		[ESI+31],byte 0
		PutStr	ingreseComp
		nwln
		GetStr  buffer			; Guardo la expresion de entrada en buffer
		mov		EAX,buffer		; Copio buffer al EAX para leer la expresion
		mov		EBX,0			; Contiene el offset de expresion para ir armando la expresion postfija
		mov		CX,0			; Para mostrar la pila al final

		mov		dl,byte[EAX]
		cmp		dl,'-'
		je		procesoInverso
		
cicloPrepComp:	
		mov		dl,byte[EAX]
		cmp		dl,0
		je		imprimirBins
		mov		[ESI],dl
		inc		ESI
		inc		EAX
		jmp		cicloPrepComp
		
imprimirBins:
		mov		[complementoOn],byte 1	; Marcador para que despues de calcular el numero, se devuelva aca
		jmp		leerNumero
retComp:
		pop		EDX
		mov		CX,32
		mov		EAX,EDX		; hago una copia del numero
printBins:					; Print numero normal
		cmp		CX,0
		je		nowNeg
		shl		EDX,1
		jc		print1
		PutInt	0
		jmp		goOn
print1:
		PutInt  1
goOn:
		dec		CX
		jmp		printBins
nowNeg:						; Ahora negado
		nwln
		mov		EDX,EAX
		not		EDX
		mov		EAX,EDX
		mov		CX,32
		nwln
		PutStr  negado1
		nwln
		PutStr  negado2
		nwln
		nwln
printBins2:					; Print numero negado
		cmp		CX,0
		je		nowPlus
		shl		EDX,1
		jc		printt
		PutInt	0
		jmp		goOn2
printt:
		PutInt  1
goOn2:
		dec		CX
		jmp		printBins2	
nowPlus:					; Suma uno
		mov		EDX,EAX
		inc		EDX
		mov		CX,32
		nwln
		nwln
		PutStr  plus1
		nwln
		nwln
		PutCh   '='
		nwln
		nwln
printBins3:					; Print del numero negado +1
		cmp		CX,0
		je		doneForReal
		shl		EDX,1
		jc		printtt
		PutInt	0
		jmp		goOn3
printtt:
		PutInt  1
goOn3:
		dec		CX
		jmp		printBins3	
		
		
procesoInverso:							; Por si entra un numero negativo, se hace el proceso al reves

		mov		[complementoOn],byte 0
cicloPrepCompN:
		inc		EAX				; Se salta el - , pero ya sabe que es negativo
		mov		dl,byte[EAX]
		cmp		dl,0
		je		imprimirBinsN
		mov		[ESI],dl
		inc		ESI
		jmp		cicloPrepCompN
		
imprimirBinsN:
		mov		[complementoInv],byte 1	; Marcador para que despues de calcular el numero, se devuelva aca
		jmp		leerNumero
retCompN:
		pop		EDX
		mov		CX,32
		neg		EDX			; Numero negado +1 desde el principio ya que es negativo
		mov		EAX,EDX		; hago una copia del numero
printBinsN:					; Print numero normal
		cmp		CX,0
		je		nowNegN
		shl		EDX,1
		jc		print1N
		PutInt	0
		jmp		goOnN
print1N:
		PutInt  1
goOnN:
		dec		CX
		jmp		printBinsN
nowNegN:						; Ahora negado
		nwln
		mov		EDX,EAX
		not		EDX
		mov		EAX,EDX
		mov		CX,32
		nwln
		PutStr  negado1
		nwln
		PutStr  negado2
		nwln
		nwln
printBins2N:					; Print numero negado
		cmp		CX,0
		je		nowPlusN
		shl		EDX,1
		jc		printtN
		PutInt	0
		jmp		goOn2N
printtN:
		PutInt  1
goOn2N:
		dec		CX
		jmp		printBins2N
nowPlusN:					; Suma uno
		mov		EDX,EAX
		inc		EDX
		mov		CX,32
		nwln
		nwln
		PutStr  plus1
		nwln
		nwln
		PutCh   '='
		nwln
		nwln
printBins3N:					; Print del numero negado +1
		cmp		CX,0
		je		doneForReal
		shl		EDX,1
		jc		printttN
		PutInt	0
		jmp		goOn3N
printttN:
		PutInt  1
goOn3N:
		dec		CX
		jmp		printBins3N	
		
cicloLectura:					; Ciclo para leer la expresion y pasarla a postfija en la variable 'expresion'

		PutStr  cicloLecturaP
		nwln
		PutCh	'E'
		PutCh	'A'
		PutCh	'X'
		PutCh	':'
		PutCh	' '
		PutInt  AX
		nwln
		PutStr	cxEquals
		PutInt	CX
		PutCh	' '
		PutStr  whileReading
		PutCh	byte[EAX]
		nwln
		cmp		[EAX],dword 0	; Condicion de Parada
		je		sacarTodo2		; Salir del ciclo
		;PutStr	print2
		;nwln
		cmp		byte[EAX],'('	; Si es '(' no se hace nada, y se sigue el ciclo
		je		parIzq			; Seguir el ciclo
		;PutStr	print2
		;nwln
		cmp		byte[EAX],')'	; Si es ')' se procede a sacar todo de la pila y meterlo a expresion
		je		sacarTodo		; Salta al proceso para sacar todo de la pila con base al contador de CX
		;PutStr	print2
		;nwln
		cmp		byte[EAX],'+'	; Compara si es un operador de suma
		je		OPsuma			; Salta a procesarlo
		;PutStr	print2
		;nwln
		cmp		byte[EAX],'-'	; Compara si es un operador de resta
		je		OPresta			; Salta a procesarlo
		;PutStr	print2
		;nwln
		cmp		byte[EAX],'*'	; Compara si es un operador de multiplicacion
		je		OPmul			; Salta a procesarlo
		;PutStr	print2
		;nwln
		cmp		byte[EAX],'/'	; Compara si es un operador de division
		je		OPdivision		; Salta a procesarlo
		;PutStr	print2
		;nwln	
		cmp		byte[EAX],'='	; Si se pide un resultado, lo guardamos en solicitudResultado
		je		casoRes
		
		mov		dl,byte[EAX]	; Si no cumple con ningun caracter, debe ser numero o '='
		cmp		dl,0
		je		sacarTodo2
		
		PutStr  casoGuaba
		PutCh	dl
		nwln
		jmp		armarExpresion	; Se mete a la pila
		
parIzq:
		PutStr	ParIzq
		nwln
		push 	word[EAX]
parIzq2:
		inc		EAX
		jmp 	cicloLectura
		
sacarTodo:
		PutStr	ParDer
		nwln
		cmp		CX, 0
		je		parIzq2
		pop 	DX				; Saca un elemento de la pila
		PutStr	sacandoTodo
		nwln
		cmp		dl,'('
		je		parIzq2
		jmp		armarExpresion	; Ingresa elemento a la expresion postfija
seguirSacarTodo:
		loop	sacarTodo		; llamada a sacarTodo hasta que CX = 0 (Decrementa al CX hasta llegar a zero)
		inc		EAX
		jmp		cicloLectura
		
sacarTodo2:
		mov		byte[EAX],'['
		PutStr	final
		nwln
		cmp		CX,word 0
		je		done
		pop 	DX				; Saca un elemento de la pila
		PutCh	dl
		nwln
		jmp		armarExpresion	; Ingresa elemento a la expresion postfija
seguirSacarTodo2:
		loop	sacarTodo2		; llamada a sacarTodo hasta que CX = 0 (Decrementa al CX hasta llegar a zero)
		jmp		postfijoListo
		
;+++++++++++++++++ SUMA +++++++++++++++++;		
OPsuma:	
		PutStr	suma			; Print de suma
		nwln
		cmp		CX,word 0		; Pregunta si hay algo en la pila
		je		pushSuma		; Si no hay nada, se prosigue a hacer push a la suma
		PutStr  revisandoPila
		nwln
		pop		DX				; Si si, se prosigue a intercambiar elementos de la pila y hacer pop al cambiado (no se incrementa CX)
		cmp 	dl,'('
		je 		pushpushSuma
		push 	word[EAX]		; Push a [EAX] que tiene la suma : CASO DE CAMBIO
		jmp		armarExpresion  ; Se prosigue a insertar el elemento del pop a la expresion que queda en el DX (dl)
pushpushSuma:
		PutStr  volviendoAMeter
		PutCh   dl
		nwln
		push	DX
pushSuma:
		push	word[EAX]		; Push de la suma a la pila
		inc		CX				; Incrementa el contador de elementos en la pila
seguirSuma:		
		inc		EAX				; Incrementa la direccion de memoria de la expresion de entrada
		jmp 	cicloLectura
		
;----------------- RESTA -----------------;		
OPresta:	
		PutStr	resta			; Print de suma
		nwln
		cmp		CX,word 0		; Pregunta si hay algo en la pila
		je		pushResta		; Si no hay nada, se prosigue a hacer push a la resta
		PutStr  revisandoPila
		nwln
		pop		DX				; Si si, se prosigue a intercambiar elementos de la pila y hacer pop al cambiado (no se incrementa CX)
		cmp		dl,'('
		je		pushpushResta
		push 	word[EAX]		; Push a [EAX] que tiene la resta
		jmp		armarExpresion  ; Se prosigue a insertar el elemento del pop a la expresion que queda en el DX (dl)
pushpushResta:
		PutStr  volviendoAMeter
		PutCh   dl
		nwln
		push 	DX
pushResta:
		push	word[EAX]		; Push de la resta a la pila
		inc		CX				; Incrementa el contador de elementos en la pila
seguirResta:		
		inc		EAX				; Incrementa la direccion de memoria de la expresion de entrada
		jmp 	cicloLectura
		
;**************** MULTIPLICACION ****************;		
OPmul:	
		PutStr	multiplicacion	; Print de multiplicacion
		nwln					; Se compara la procedencia del elemento de la pila
		cmp		CX,word 0		; Pregunta si hay algo en la pila
		je		pushMul			; Si no hay nada, se prosigue a hacer push a la multiplicacion
		pop		DX				; Si anterior >=, se prosigue a intercambiar elementos de la pila y hacer pop al cambiado (no se incrementa CX)
		PutStr  revisandoPila
		nwln
		cmp		dl,'('
		je		pushpushMul
		cmp     dl,'-'
		je		pushpushMul		; Si no es menor que el pasado, se pushea normal Pero hay que meter el DX a la pila otra vez
		cmp		dl,'+'
		je		pushpushMul		; Igual, si no es menor, se pushea normal pero primero hay que volver a meter el DX
		push 	word[EAX]		; Push a [EAX] que tiene la multiplicacion
		jmp		armarExpresion  ; Se prosigue a insertar el elemento del pop a la expresion que queda en el DX (dl)
pushpushMul:
		PutStr  volviendoAMeter
		PutCh   dl
		nwln
		push    DX
pushMul:
		push	word[EAX]		; Push de la multiplicacion a la pila
		inc		CX				; Se aumenta el contador de elementos en la pila
SeguirMul:
		inc		EAX				; Incrementa la direccion de memoria de la expresion de entrada
		jmp 	cicloLectura
		
;///////////////// DIVISION /////////////////;		
OPdivision:	
		PutStr	division		; Print de division
		nwln
		cmp		CX,word 0		; Pregunta si hay algo en la pila
		je		pushDiv			; Si no hay nada, se prosigue a hacer push a la division
		PutStr  revisandoPila
		nwln
		pop		DX				; Si si, se prosigue a intercambiar elementos de la pila y hacer pop al cambiado (no se incrementa CX)
		cmp		dl,'('
		je		pushpushDiv
		cmp     dl,'-'
		je		pushpushDiv		; Si no es menor que el pasado, se pushea normal Pero hay que meter el DX a la pila otra vez
		cmp		dl	,'+'
		je		pushpushDiv		; Igual, si no es menor, se pushea normal pero primero hay que volver a meter el DX
		push 	word[EAX]		; Push a [EAX] que tiene la division
		jmp		armarExpresion  ; Se prosigue a insertar el elemento del pop a la expresion que queda en el DX (dl)
pushpushDiv:
		PutStr  volviendoAMeter
		PutCh   dl
		nwln
		push    DX
pushDiv:
		push	word[EAX]		; Push de la division a la pila
		inc		CX				; Se aumenta el contador de elementos en la pila
seguirDiv:
		inc		EAX				; Incrementa la direccion de memoria de la expresion de entrada
		jmp 	cicloLectura
		
;===============; ARMA LA EXPRESION AGREGANDO CARACTERES DEL DX (DX) ;===============; 

casoRes:								; CASO DE SOLICITUD DE RESULTADO
		PutStr	guardandoPeticion
		nwln
		mov		EDI,solicitudResultado
		
		PutCh	byte[EAX]
		nwln
		
		inc		EAX
		
		PutCh	byte[EAX]
		nwln
		
		cmp		byte[EAX],'b'
		je		b
		cmp		byte[EAX],'o'
		je		o
		cmp		byte[EAX],'h'
		je		h
		jmp		errorCifra
b:
		PutCh	'E'
		PutCh	'n'
		PutCh	' '
		PutCh	'b'
		PutCh	'.'
		PutCh	'.'
		nwln
		mov		[EDI],byte'b'
		inc		EAX
		jmp		cicloLectura
o:
		PutCh	'E'
		PutCh	'n'
		PutCh	' '
		PutCh	'o'
		PutCh	'.'
		PutCh	'.'
		nwln
		mov		[EDI],byte'o'
		inc		EAX
		jmp		cicloLectura
h:
		PutCh	'E'
		PutCh	'n'
		PutCh	' '
		PutCh	'h'
		PutCh	'.'
		PutCh	'.'
		nwln
		mov		[EDI],byte'h'
		inc		EAX
		jmp		cicloLectura

armarExpresion:

		mov		EDI,expresion	; Se pasa la direccion de expresion a EDI 
		mov     [EDI+EBX], dl	; Se inserta el caracter a expresion en el campo vacio
		inc		EBX				; EBX va a tener el offset del nuevo espacio de expresion

		cmp		byte[EAX],'0'
		jge		psn1
		jmp		seguirArmando
psn1:
		cmp		byte[EAX],'9'
		jle		esNumero
		cmp		byte[EAX],'A'
		jge		psn2
		jmp		seguirArmando
psn2:
		cmp		byte[EAX],'F'
		jle		esNumero
		jmp 	seguirArmando
esNumero:
		PutStr	EsNumero
		nwln
		
		inc 	EAX
		cmp		byte[EAX],'+'
		je		ponerComa
		cmp		byte[EAX],'-'
		je		ponerComa
		cmp		byte[EAX],'*'
		je		ponerComa
		cmp		byte[EAX],'/'
		je		ponerComa
		cmp		byte[EAX],'('
		je		ponerComa
		cmp		byte[EAX],')'
		je		ponerComa
		cmp		byte[EAX],'='
		je		ponerComa
		cmp		byte[EAX],0
		je		ponerComa
		
		dec 	EAX
		jmp 	seguirArmando
ponerComa:
		mov		dl,','
		mov		[EDI+EBX], dl
		inc		EBX
		dec 	EAX
		xor		dl,dl
seguirArmando:

		PutStr  expresionPrint
		PutStr	expresion
		nwln
		;PutStr  print3
		;nwln
		cmp		EBX,64			; Si se llega al tope de expresion, no se continua
		je		done
		;PutStr  print3
		;nwln
		cmp		byte[EAX],'['	; Si es el final de la expresion y se saca todo de la pila
		je		seguirSacarTodo2; Salta al ciclo de loop para sacar todo de la pila
		;PutStr  print3
		;nwln
		;PutCh   byte[EAX]
		cmp		byte[EAX],')'	; Si se encontro un ')' se saca todo de la pila
		je		seguirSacarTodo ; Salta al ciclo de loop para sacar todo de la pila
		;PutStr  print3
		;nwln
		cmp		dl,'+'			; Para saber a donde saltar hace compares del elemento ingresado (pop DX -> expresion)
		je 	    seguirSuma		; No incrementa CX ya que la pila quedo igual por el intercambio de elementos
		;PutStr  print3
		;nwln
		cmp		dl,'-'			; Para saber a donde saltar hace compares del elemento ingresado (pop DX -> expresion)
		je		seguirResta		; No incrementa CX ya que la pila quedo igual por el intercambio de elementos
		;PutStr  print3
		;nwln
		cmp		dl,'*'			; Para saber a donde saltar hace compares del elemento ingresado (pop DX -> expresion)
		je		seguirSuma		; No incrementa CX ya que la pila quedo igual por el intercambio de elementos
		;PutStr  print3
		;nwln
		cmp		dl,'/'			; Para saber a donde saltar hace compares del elemento ingresado (pop DX -> expresion)
		je		seguirSuma		; No incrementa CX ya que la pila quedo igual por el intercambio de elementos
		;PutStr  print3
		;nwln
normal:
		;PutStr	cxEqualsAgain
		;PutInt	CX
		;nwln
		inc		EAX
		jmp		cicloLectura	; Caso que sea un numero o un '=' se agrega a la expresion inmediatamente y se devuelve
    
postfijoListo:
		PutStr  finalPostfija
		nwln
   		PutStr	expresion	; Para este punto, tendremos la expresion postfija lista y en expresion
		nwln
							; Hay que recorrerla con offset
		;jmp 	done			
		
		xor		ESI,ESI
		xor		EDI,EDI
		
		mov		EDI,expresion				; Asigno el inicio de la direccion de memoria de la expresion postfija a EDI 				
			
;{[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[  MOTOR DE CALCULACION  [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[};

motor:					; Limpiar registros
		xor		EAX,EAX
		xor		EBX,EBX
		xor		ECX,ECX
		xor		EDX,EDX
		mov		ESI,entero
		mov		[ESI+0],byte 0
		mov		[ESI+1],byte 0
		mov		[ESI+2],byte 0
		mov		[ESI+3],byte 0
		mov		[ESI+4],byte 0
		mov		[ESI+5],byte 0
		mov		[ESI+6],byte 0
		mov		[ESI+7],byte 0
		mov		[ESI+8],byte 0
		mov		[ESI+9],byte 0
		mov		[ESI+10],byte 0
		mov		[ESI+11],byte 0
		mov		[ESI+12],byte 0
		mov		[ESI+13],byte 0
		mov		[ESI+14],byte 0
		mov		[ESI+15],byte 0
		mov		[ESI+16],byte 0
		mov		[ESI+17],byte 0
		mov		[ESI+18],byte 0
		mov		[ESI+19],byte 0
		mov		[ESI+20],byte 0
		mov		[ESI+21],byte 0
		mov		[ESI+22],byte 0
		mov		[ESI+23],byte 0
		mov		[ESI+24],byte 0
		mov		[ESI+25],byte 0
		mov		[ESI+26],byte 0
		mov		[ESI+27],byte 0
		mov		[ESI+28],byte 0
		mov		[ESI+29],byte 0
		mov		[ESI+30],byte 0
		mov		[ESI+31],byte 0

		;mov 	ESI,0						; Asigno el inicio de la direccion de memoria del entero variable a ESI 

cicloCalcu:									; Avanzo en la expresion para ir calculando cada numero
											; Para encontrar el final de un numero, pregunto si hay ','
		cmp		byte[EDI],0
		je		done
		mov 	al,byte[EDI]				; Movemos el caracter de la expresion a al
		PutCh	'a'
		PutCh	'l'
		PutCh	':'
		PutCh	' '
		PutCh	al
		nwln
		cmp		al,0
		je		done
		
		cmp		al,','						; Final de un numero => entero esta listo para ser procesado
		je		leerNumero					; Salta a descifrar base numerica, calcular decimal y hacer push.
		
		cmp		al,'+'						; Si encuentra un operador, salta a la operacion correspondiente
		je		hacerOpSuma

		cmp		al,'-'
		je		hacerOpResta
		
		cmp		al,'*'
		je		hacerOpMul
		
		cmp		al,'/'
		je		hacerOpDiv
											; Si no es operador, es digito (o letra del numero para mostrar base numerica)
		PutStr	moviendo
		PutCh	al
		nwln
		
		mov		[ESI],al			; Copiamos byte leido al byte vacante de entero
		
		inc		EDI
		inc		ESI
		jmp		cicloCalcu

darRes:
		cmp		byte[EDI],'b'
		je		darBinRes
		cmp		byte[EDI],'o'
		je		darOctRes
		cmp		byte[EDI],'h'
		je		darHexRes
		jmp		errorCifra
darBinRes:
		PutStr	resBin
		nwln
		pop		EAX
		mov		EBX,2
		mov 	ECX, 0
	ciclo1PAX: 
		xor 	EDX,EDX		; Deja limpio el receptor del residuo
		div 	BX			; Divide (DX:AX)/EBX	(BX tiene la base destino)
		push 	DX			; Residuo en EDX -> Guardar residuo en la pila
		inc 	CX			; Incrementa el contador de digitos del numero
		cmp 	AX,0		; Condicion de parada para ver si EAX ya no se puede dividir
		jne 	ciclo1PAX	; Si puede seguir dividiendo, devuelvase al ciclo		
	ciclo2PAX: 
		pop 	DX			
		PutInt	DX
		loop 	ciclo2PAX
		nwln
		jmp 	doneForReal
		
darOctRes:
		PutStr	resOct
		nwln
		pop		EAX
		mov		EBX,8
		mov 	ECX, 0
	ciclo1PAXOct: 
		xor 	EDX,EDX		; Deja limpio el receptor del residuo
		div 	BX			; Divide (DX:AX)/EBX	(BX tiene la base destino)
		push 	DX			; Residuo en EDX -> Guardar residuo en la pila
		inc 	CX			; Incrementa el contador de digitos del numero
		cmp 	AX,0		; Condicion de parada para ver si EAX ya no se puede dividir
		jne 	ciclo1PAXOct; Si puede seguir dividiendo, devuelvase al ciclo		
	ciclo2PAXOct: 
		pop 	DX			
		PutInt	DX
		loop 	ciclo2PAXOct
		nwln
		jmp 	doneForReal
darHexRes:
		PutStr	resHex
		nwln
		pop		EAX
		mov		EBX,16
		mov 	ECX, 0
	ciclo1PAXHex: 
		xor 	EDX,EDX		; Deja limpio el receptor del residuo
		div 	BX			; Divide (DX:AX)/EBX	(BX tiene la base destino)
		push 	DX			; Residuo en EDX -> Guardar residuo en la pila
		inc 	CX			; Incrementa el contador de digitos del numero
		cmp 	AX,0		; Condicion de parada para ver si EAX ya no se puede dividir
		jne 	ciclo1PAXHex; Si puede seguir dividiendo, devuelvase al ciclo		
	ciclo2PAXHex: 
		pop 	DX			
		cmp		DX,10
		je		putTen
		cmp		DX,11
		je		putEleven
		cmp		DX,12
		je		putTwelve
		cmp		DX,13
		je		putThirteen
		cmp		DX,14
		je		putFourteen
		cmp		DX,15
		je		putFifteen
		PutInt	DX
nextRem:
		loop 	ciclo2PAXHex
		nwln
		jmp 	doneForReal
putTen:
		PutCh	'A'
		jmp		nextRem
putEleven:
		PutCh	'B'
		jmp		nextRem
putTwelve:
		PutCh	'C'
		jmp		nextRem
putThirteen:
		PutCh	'D'
		jmp		nextRem
putFourteen:
		PutCh	'E'
		jmp		nextRem
putFifteen:
		PutCh	'F'
		jmp		nextRem
		
hacerOpSuma:
		PutStr  sumando
		nwln
		pop		EBX
		pop		EAX
		PutLInt	EAX
		PutCh	'+'
		PutLInt	EBX
		nwln
		add		EAX,EBX
		PutCh   '='
		nwln
		PutLInt	EAX
		nwln
		push	EAX
		inc		EDI
		jmp 	motor
		
hacerOpResta:
		PutStr  restando
		nwln
		pop		EBX
		pop		EAX
		PutLInt	EAX
		PutCh   '-'
		PutLInt	EBX
		nwln
		sub		EAX,EBX
		PutCh   '='
		nwln
		PutLInt	EAX
		nwln
		push	EAX
		inc		EDI
		jmp 	motor

hacerOpMul:
		PutStr  multiplicando
		nwln
		pop		EBX
		pop		EAX
		PutLInt	EAX
		PutCh	'*'
		PutLInt	EBX
		nwln
		mul		EBX
		PutCh   '='
		nwln
		PutLInt	EAX
		nwln
		push	EAX
		inc		EDI
		jmp 	motor
		
hacerOpDiv:
		PutStr  dividiendo
		nwln
		mov		EDX,0
		pop		EBX

		pop		EAX
		PutLInt	EAX
		PutCh	'/'
		PutLInt	EBX
		nwln
		cmp		EBX,0
		je		divPorCero
		div		EBX
		PutCh   '='
		nwln
		PutLInt	EAX
		nwln
		push	EAX
		inc		EDI
		jmp 	motor
		
leerNumero:     					; Se prepara para descifrar cual base numerica tiene el numero
		xor		EAX,EAX
		xor		EBX,EBX
		xor		ECX,ECX
		xor		EDX,EDX
		inc		EDI
		PutStr  numeroListo
		nwln
		mov		EAX,entero
		mov 	bl,'b'
		mov		cl,'o'
		mov		dl,'h'
		
descifrarNumero:					; Descifra la base numerica del numero 
		cmp		[EAX],bl
		je		binario		; Si es binario
		cmp		[EAX],cl
		je		octal		; Si es octal
		cmp 	[EAX],dl
		je		hexadecimal	; Si es hexadecimal
		jmp		decimal		; Si no, es decimal
		
;===============; VERIFICAR ENTRADAS NUMERICAS ;===============;	

; BINARIO

binario:
		PutStr  EsBinario	
		nwln
		PutStr  entero
		nwln				
		inc 	EAX			; para no leer la letra otra vez
		mov		ECX,0		; para la condicion de parada
		mov 	bh,31h		; char de '1'
		mov		bl,30h		; char de '0'
validarBin:								; Valida el supuesto numero binario si solo tiene 1 y 0
		cmp		ECX,[EAX]				; Condicion de parada
		je		calcularDecimalBin		; Si llega al final sin error, se salta a calcular el valor en decimal
		cmp		bh,[EAX]
		je		seguirBin
		cmp 	bl,[EAX]
		je		seguirBin
		jmp		errorBin					; Si hay error, se salta a mandar un mensaje de error	
seguirBin:								
		inc		EAX
		jmp 	validarBin				; Continuacion del ciclo
		
calcularDecimalBin:		
convertirABin:					; 		CALCULAR VALOR DECIMAL
		mov     EBX,entero
		inc		EBX
		xor 	EAX,EAX
cantidadDigitosBin:
        mov     AX,[EBX]     	; movemos el digito singular a AX
        cmp     AX,0         	; compara si ya no hay numero (Igual a nulo)
        je      conversionBin1  ; terminamos de contar
        inc     CX         		; increment CX para saber la cantidad de digitos
        inc 	EBX				; incrementamos la direccion de memoria para el siguiente digito
        jmp     cantidadDigitosBin ; and jump back
conversionBin1:
		push	CX				; guardamos la cantidad de digitos en la pila
		dec		CX				; decrementamos la cantidad de digitos
		sub     DX,DX           ; DX := 0 -- DL keeps the sum
        sub     AX,AX			; Limpia el AX
        sub     EBX,EBX			; Limpia el EBX
        mov     EBX,1			; Guarda un 1 en la pila
		push	EBX

potencia2:
		cmp     CX,0			; condicion de parada si ya no hay mas digitos
        je      anteriorBin		; si es asi, salta a anterior para 
        mov     EAX,EBX			; Mueve el 1 a EAX
		mov		EBX,2			; Mueve un 2 a EBX
        mul     EBX				; Multiplica la fuente por EAX, en este caso fuente es EBX
        mov     EBX,EAX			; Movemos el resultado a EBX
		push	EBX				; Guardamos el resultado
        dec     CX				; decrementamos cantidad de digitos
        jmp     potencia2		; repeticion del ciclo
anteriorBin:
		sub		EAX,EAX
		sub		ECX,ECX
		sub		Ebx,Ebx
        mov     ECX,entero
        inc		ECX
        sub     EDX,EDX
conversionBin2:  
		mov     EAX,[ECX]     ; move the digit to AL
		cmp     EAX,0         ; if it is the NULL character
        je      doneBin
		and     EAX,0FH       ; mask off the upper 4 bits
		PutLInt	EAX
		nwln
		pop		EBX
		push	EDX
        mul     EBX
		pop		EDX
        add     EDX,EAX
		inc		ECX
        jmp     conversionBin2

doneBin:
        PutLInt  EDX           ; write sum
		pop	CX
		push	 EDX			; Push del numero binario a la pila
		nwln
		;PutInt CX
        ;nwln
        cmp 	[complementoOn],byte 0
        jne		retComp
        cmp		[complementoInv],byte 0
        jne		retCompN
        jmp 	motor
		
; OCTAL
		
octal:
		PutStr  EsOctal
		nwln
		PutStr  entero
		nwln
		inc 	EAX
		mov		ECX,0
		mov		bl,2Fh				; Tabla ascii para valores entre 0 y 7
		mov		bh,38h		
validarOct:
		cmp		ECX,[EAX]
		je		calcularDecimalOct
		cmp 	[EAX],bh
		jge		errorOct
		cmp 	[EAX],bl
		jle		errorOct
		jmp		seguirOct
seguirOct:
		inc 	EAX
		jmp 	validarOct
calcularDecimalOct:
convertirAOct:					; 		CALCULAR VALOR DECIMAL
		mov     EBX,entero
		inc		EBX
		xor 	EAX,EAX
cantidadDigitosOct:
        mov     AX,[EBX]     	; movemos el digito singular a AX
        cmp     AX,0         	; compara si ya no hay numero (Igual a nulo)
        je      conversionOct1  ; terminamos de contar
        inc     CX         		; increment CX para saber la cantidad de digitos
        inc 	EBX				; incrementamos la direccion de memoria para el siguiente digito
        jmp     cantidadDigitosOct ; and jump back
conversionOct1:
		push	CX				; guardamos la cantidad de digitos en la pila
		dec		CX				; decrementamos la cantidad de digitos
		sub     DX,DX           ; DX := 0 -- DL keeps the sum
        sub     AX,AX			; Limpia el AX
        sub     EBX,EBX			; Limpia el EBX
        mov     EBX,1			; Guarda un 1 en la pila
		push	EBX

potencia8:
		cmp     CX,0			; condicion de parada si ya no hay mas digitos
        je      anteriorOct		; si es asi, salta a anterior para 
        mov     EAX,EBX			; Mueve el 1 a EAX
		mov		EBX,8			; Mueve un 8 a EBX
        mul     EBX				; Multiplica la fuente por EAX, en este caso fuente es EBX
        mov     EBX,EAX			; Movemos el resultado a EBX
		push	EBX				; Guardamos el resultado
        dec     CX				; decrementamos cantidad de digitos
        jmp     potencia8		; repeticion del ciclo
anteriorOct:
		sub		EAX,EAX
		sub		ECX,ECX
		sub		Ebx,Ebx
        mov     ECX,entero
        inc		ECX
        sub     EDX,EDX
conversionOct2:  
		mov     EAX,[ECX]     ; move the digit to AL
		cmp     EAX,0         ; if it is the NULL character
        je      doneOct
		and     EAX,0FH       ; mask off the upper 4 bits
		PutLInt	EAX
		nwln
		pop		EBX
		push	EDX
        mul     EBX
		pop		EDX
        add     EDX,EAX
		inc		ECX
        jmp     conversionOct2

doneOct:
        PutLInt  EDX           ; write sum
		pop	CX
		nwln
		push 	 EDX			; Push del numero octal a la pila
		;PutInt CX
        ;nwln
        cmp 	[complementoOn],byte 0
        jne		retComp
        cmp		[complementoInv],byte 0
        jne		retCompN
        jmp 	motor
		
; HEXADECIMAL
		
hexadecimal:
		PutStr  EsHexadecimal
		nwln
		PutStr  entero
		nwln
		inc 	EAX
		mov		ECX,0
		mov		bl,2Fh		; Tabla ascii para medir numeros del 0 al 9
		mov		bh,3Ah
			
		mov		dl,40h		; Valores de tabla ascii para medir letras mayusculas de la A a la F
		mov		dh,47h
validarHex1:
		cmp		ECX,[EAX]
		je		calcularDecimalHex
		cmp 	[EAX],bh
		jge		validarHex2
		cmp 	[EAX],bl
		jle		errorHex
		jmp		seguirHex
validarHex2:
		cmp		[EAX],dh
		jge		errorHex
		cmp		[EAX],dl
		jle		errorHex
		jmp		seguirHex
seguirHex:
		inc 	EAX
		jmp 	validarHex1
calcularDecimalHex:
convertirAHex:
		mov     EBX,entero
		inc 	EBX
		xor 	EAX,EAX
cantidadDigitosHex:
        mov     AX,[EBX]     	; movemos el digito singular a AX
        cmp     AX,0         	; compara si ya no hay numero (Igual a nulo)
        je      conversionHex1  ; terminamos de contar
        inc     CX         		; increment CX para saber la cantidad de digitos
        inc 	EBX				; incrementamos la direccion de memoria para el siguiente digito
        jmp     cantidadDigitosHex ; and jump back
conversionHex1:
		push	CX				; guardamos la cantidad de digitos en la pila
		dec		CX				; decrementamos la cantidad de digitos
		sub     DX,DX           ; DX := 0 -- DL keeps the sum
        sub     AX,AX			; Limpia el AX
        sub     EBX,EBX			; Limpia el EBX
        mov     EBX,1			; Guarda un 1 en la pila
		push	EBX

potencia16:
		cmp     CX,0			; condicion de parada si ya no hay mas digitos
        je      anteriorHex		; si es asi, salta a anterior para 
        mov     EAX,EBX			; Mueve el 1 a EAX
		mov		EBX,16			; Mueve un 16 a EBX
        mul     EBX				; Multiplica la fuente por EAX, en este caso fuente es EBX
        mov     EBX,EAX			; Movemos el resultado a EBX
		push	EBX				; Guardamos el resultado
        dec     CX				; decrementamos cantidad de digitos
        jmp     potencia16		; repeticion del ciclo
anteriorHex:
		sub		EAX,EAX
		sub		ECX,ECX
		sub		Ebx,Ebx
        mov     ECX,entero
        inc 	ECX
        sub     EDX,EDX
conversionHex2:  
		mov     EAX,[ECX]     ; move the digit to AL
		cmp     EAX,0         ; if it is the NULL character
        je      doneHex
        and		al,0F0H	  	  ; para ver si es una letra
        cmp 	al,40H
        je		ensamblarLetra
        xor		EAX,EAX
        mov    	EAX,[ECX]
        jmp 	normalHex
ensamblarLetra:
        xor		EAX,EAX
        mov    	EAX,[ECX]
		and     EAX,0FH       ; mask off the upper 4 bits
		cmp		al,1
		je		ponerA
		cmp		al,2
		je		ponerB
		cmp		al,3
		je		ponerC
		cmp		al,4
		je		ponerD
		cmp		al,5
		je		ponerE
		cmp		al,6
		je		ponerF
		jmp		errorHex	; si no entro en ninguna, algo salio mal... la entrada puede ser
ponerA:
		mov 	al,10
		jmp 	mulHex	
ponerB:
		mov 	al,11
		jmp 	mulHex
ponerC:
		mov 	al,12
		jmp 	mulHex
ponerD:
		mov 	al,13
		jmp 	mulHex
ponerE:
		mov 	al,14
		jmp 	mulHex
ponerF:
		mov 	al,15
		jmp 	mulHex
normalHex:		
		and     EAX,0FH       ; mask off the upper 4 bits
mulHex:
		PutLInt	EAX
		nwln
		pop		EBX
		push	EDX
        mul     EBX
		pop		EDX
        add     EDX,EAX
		inc		ECX
        jmp     conversionHex2

doneHex:
        PutLInt  EDX           ; write sum
		pop	CX
		push	 EDX			; Push del numero hexadecimal a la pila
		nwln
		;PutInt CX
        nwln
        cmp 	[complementoOn],byte 0
        jne		retComp
        cmp		[complementoInv],byte 0
        jne		retCompN
        jmp 	motor
		
; DECIMAL 

decimal:
		PutStr  EsDecimal
		nwln
		PutStr  entero
		nwln
		mov		ECX,0
		mov		bl,2Fh		; Tabla ascii para medir numeros del 0 al 9
		mov		bh,3Ah
validarDec:
		cmp		[EAX],dword 0
		je		calcularDecimalDec
		cmp 	[EAX],bl
		jle		errorDec
		cmp		[EAX],bh
		jge		errorDec
		jmp 	seguirDec
seguirDec:
		inc		EAX
		jmp		validarDec
calcularDecimalDec:	

convertirAInt:
		mov     EBX,entero
		xor 	EAX,EAX
cantidadDigitos:
        mov     AX,[EBX]     	; movemos el digito singular a AX
        cmp     AX,0         	; compara si ya no hay numero (Igual a nulo)
        je      conversionInt1  ; terminamos de contar
        inc     CX         		; increment CX para saber la cantidad de digitos
        inc 	EBX				; incrementamos la direccion de memoria para el siguiente digito
        jmp     cantidadDigitos ; and jump back
conversionInt1:
		push	CX				; guardamos la cantidad de digitos en la pila
		dec		CX				; decrementamos la cantidad de digitos
		sub     DX,DX           ; DX := 0 -- DL keeps the sum
        sub     AX,AX			; Limpia el AX
        sub     EBX,EBX			; Limpia el EBX
        mov     EBX,1			; Guarda un 1 en la pila
		push	EBX

potencia10:
		cmp     CX,0			; condicion de parada si ya no hay mas digitos
        je      anterior		; si es asi, salta a anterior para continuar con la conversion
        mov     EAX,EBX			; Mueve el 1 a EAX
		mov		EBX,10			; Mueve un 10 a EBX
        mul     EBX				; Multiplica la fuente por EAX, en este caso fuente es EBX
        mov     EBX,EAX			; Movemos el resultado a EBX
		push	EBX				; Guardamos el resultado
        dec     CX				; decrementamos cantidad de digitos
        jmp     potencia10		; repeticion del ciclo
anterior:
		sub		EAX,EAX
		sub		ECX,ECX
		sub		Ebx,Ebx
        mov     ECX,entero
        sub     EDX,EDX
conversionInt2:  
		mov     EAX,[ECX]     ; move the digit to AL
		cmp     EAX,0         ; if it is the NULL character
        je      done1
		and     EAX,0FH       ; mask off the upper 4 bits
		;PutLInt	EAX
		;nwln
		pop		EBX
		push	EDX
        mul     EBX
		pop		EDX
        add     EDX,EAX
		inc		ECX
        jmp     conversionInt2

done1:
        ;PutLInt  EDX           ; write sum
		pop	CX
		;nwln
		push	 EDX			; Push al valor del numero decimal
		;PutInt CX
        ;nwln
        cmp 	[complementoOn],byte 0
        jne		retComp
        cmp		[complementoInv],byte 0
        jne		retCompN
        jmp 	motor

convertirDecABin:
		
		
; MENSAJES DE ERROR DE ENTRADA 
		
errorBin:
		PutStr	inputErrorBin
		nwln
		jmp 	done
errorOct:
		PutStr	inputErrorOct
		nwln
		jmp		done
errorHex:
		PutStr	inputErrorHex
		nwln
		jmp		done
errorDec:
		PutStr	inputErrorDec
		nwln
		jmp 	done	
errorCifra:
		PutStr	malaCifra
		nwln	
		jmp		doneForReal
divPorCero:
		PutStr  divCero
		nwln
		jmp		doneForReal
done:	
		mov		EDI,solicitudResultado
		cmp		byte[EDI],0
		je		doneForReal
		PutStr	notDoneYet
		nwln
		jmp		darRes		
doneForReal:
		nwln
		nwln
		xor		EAX,EAX
		PutStr	continuar?
		nwln
		GetCh	al
		cmp		al,'y'
		je		leerLinea
		cmp		al,'n'
		je		menu
		jmp		doneForReal
exit:
		PutStr  datos1
		nwln
		PutStr  datos2
		nwln
		PutStr  datos3
		nwln
		PutStr  datos4
     .EXIT     
     

; imprime a la salida estándar un número que supone estar en el AX
; Recibe la base en la que quiere desplegarlo en el BX
; supone que es un número positivo y natural en 16 bits.
; lo imprime en decimal.
    

