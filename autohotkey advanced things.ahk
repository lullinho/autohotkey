#NoEnv
#SingleInstance, Force



;enviando grandes textos, grandes informações
::txt.:: ;entre () aceita até 16.000 caracteres, e ele insere o caractere, demora um pouco, como se fosse digitando rapido 
(
Joe
Have
u lacueasa
sa
saksa

)
;outra alternativa, voce coloca o texto em algum arquivo e usa FileRead para ler o texto do arquivo, dessa forma vai carregar bem mais rapido e vc n vai ter o limite de 16000 caracteres
FileRead, clipboard, C:\Users\Estudos\Desktop\Ultimos_txt\redes_sociais.txt ;fileread e copia para o clipboard, foi copiado tudo
::txt2.:: ;armazenado no txt2
Send, ^v ;ctrl+V colar
return

;melhor alternativa, colocar entre () e antes colocar um clipboard para copiar e depois colar
::txt3.::
(
oi
lixo
ola
Tudo bem?

)
Send, ^v
return

 




;FUNCTIONS
myFunc(x,y,z){
	MsgBox % x A_Tab y A_Tab z
}
; chamar a funcao
myFunc("oi", "oi", "oi")



Gosub, My_subroutine ; quando chegar aqui pula para o label my_subroutine e executa ele, quando termina de executar ele, volta para essa linha e termina o resto


/*Variable
*/
X:="START" ;variavel x que tem start string
X.="|MORE" ;concatenar |more a variavel x
Y:=10 ; y=10
Y+=2 ;adiciona 2 ao y
Y++ ;adiciona 1
Y-- ;subtrai 1
MsgBox % Y ;exibir valor de y


; variaveis, variable
name:="Jackie"
::nm.::
Send, %name%,
return

;enviar alguma coisa varias vezes, 
::o.::;{* 20} ;envia 20x o * , precisa por * + espaço + o numero de vezes que quer repetir

;mover o curso pra certo ponto do texto
::html.::<span style='color:blue'></style>{left 9} ;digita esse codigo e move 7x o cursor para a esquerda

;no backscaping, mantem o que foi escrito e adiciona o resto
:B0:Ola::Tudo bem? ; mantem o comando ola, o 'B0' faz isso..





; !=Not equal
; >= <= < > AND OR

X:=11
If(X=10){
	MsgBox %X% = 10
	
}else msgbox nao eh um 10
	
#Persistent ; //will keep the script running
ToolTip, Minha tooltip ; display tooltip
Sleep, 2000 ;espera 2 segundos
Tooltip ;encerra o tooltip

;colocar uma caixa de texto na tela
SplashTextOn, 200, 50, Meu titulo, meu texto
Sleep, 4000
SplashTextOff ;encerra o splashtext

MsgBox Hi

;label, usado para criar um ponto de rotina
My_subroutine: 
MsgBox Inside my GoSub Routine
Return


;sending unicode
::g.::{U+00C4} ;voce pode exibir emojins e tudo

