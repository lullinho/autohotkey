#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent



; para criar várias guis, pode dar nome diferentes para ela
; igual exemplo abaixo, primeira gui se chama main e a outra se chama settings


Gui Main:New,, titulo da janela ; criar uma nova gui, nome da gui é main a vírgula ali é options
Gui Settings:New,, This is the settings window ; cria outra gui e nome da gui é settings

	; exibindo as guis

Gui Main:Show, w800 h200 ; pede para o ahk mostrar a janela com width e height
Gui Settings:Show, w800 h200 ; exibe a gui settings



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;; AS OPTIONS DA GUI;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; as options podem ser adicionadas com sinal + ou - caso queira acionar ou desacionar a option

; +AlwaysOnTop = deixa a janela sempre vísivel na frente
; -Caption = tira a borda que o windows poe por padrao nas janelas, fica sem borda preta, tira o minimizar, etc
; +ToolWindow = coloca uma barra no topo permitindo fechar, fica sem minimizar e maximizar
; +Resize = permite aumentar ou diminuir o tamanho da janela

Gui Teste:New, +AlwaysOnTop +ToolWindow, Janela sempre vísivel ; essa opção deixa a janela sempre vísivel na frente
Gui Teste:Show, w400 h400

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;; ADD CONTROL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 1º - cria uma janela (Gui, New)
; 2º adicona controls na janela (Gui, Add)
; 3º mostra a janela (Gui, Show)

;;;;;;;;;;;Controls: Text, DropDownList, Button, Checkbox, Edit(campo editável) etc

; xp ou yp = usar exatamente a mesma posição do control anterior (xp = direita/esquerda)(yp=cima/baixo)
; xp+10 = vai estar em cima do control anterior só que um pouco mais pra direita.
; x+10 y+10 = espaço entre o control anterior
; cRed ou c#854sdf ; define a cor de qualquer control menos dos buttons, pode escrever hexadecimal color ou cor
; Gui, Font,, MS Sans Serif ; pode definir fonte e weight
; left,right,center = justificar o texto
; +border = adiciona borda
; hidden = oculta o control mas ele ocupa espaço de um control
; readonly = pode interagir copiando o texto etc mas nao pode adicionar informações, escrever
; disabled = desabilita o control, não pode interagir

; Para definir um control ao lado, a direita do outro basta adicionar apenas x+10
; Ignorando o y para definir abaixo

Gui main:New, +AlwaysOnTop +Resize , Main
Gui Add, Text , +border right cBlue w50, texto na direita ; Adiciona um texto com o texto definido
Gui Add, Text, +border center cRed w75, texto no centro
Gui Add, Button, w75, Okay ; adiciona um botão nome Ok, width 75
Gui Add, Button, w75 x+150, cc ; x75 = absolute value, w+15 = espaço entre o control anterior
Gui main:Show, w800 h200 x200 y600 ; w = width h = height, x = posição em pixels, y = posição em pixels(posição da janela), título
; recomendável é usar o título da janela no comando new e no comando show se concentrar na posição e tamanho da janela só

; Esconder janela
Gui main:Cancel
Gui main:Hide
Gui main:Show ; mostra janela novamente




	; DropDownList - teste
Gui Add, DropDownList, vSelectedOption, opttion1|option2 | option 3 ; cria um dropdown list e adiciona as opções nela
Gui Add, button, w75 gSubmit, Okay
Gui Show
return

Submit: ; salva a informação
Gui Submit ; salva a informação
MsgBox %SelectedOption%
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; COLUNAS E LINHAS DE CONTROLS = SECTION = SALVA POSIÇÃO DO XY
; section = salva a posição xy do control para depois ser retrieved por outro control usando xs/ys
Gui coluna:New,, teste window
Gui coluna:Add, button, section w75, coluna 1 ; cria uma seção, coluna 1, tudo fica um embaixo do outro
Gui coluna:Add, button, w75, okay2
Gui coluna:Add, button, w75, okay 3
Gui coluna:Add, button, w75, okay 4
Gui coluna:Add, Button, w75 ys, Coluna 2 ; usando ys cria outra coluna referencia o primeiro section acima, fica do lado do primeiro section
Gui coluna:Add, button, w75, okay2
Gui coluna:Add, button, w75, okay 3
Gui coluna:Add, button, w75, okay 4
Gui coluna:Show

Gui linha:New,, teste window
Gui linha:Add, button, w75 Section, linha1
Gui linha:Add, button, x+10 w75, ok1
Gui linha:Add, button, x+10 w75, ok2
Gui linha:Add, button, x+10 w75, ok3
Gui linha:Add, button, x+10 w75, ok4
Gui linha:Add, button, xs w75 y+50, linha2
Gui linha:Add, button, x+10 w75, ok1
Gui linha:Add, button, x+10 w75, ok2
Gui linha:Add, button, x+10 w75, ok3
Gui linha:Add, button, x+10 w75, ok4
Gui linha:Show

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;SALVAR INFORMAÇÃO DO USUÁRIO - VARIABLES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1. definir variavel nas opcoes do control basta colocar v na frente
; 2. para acessar variavel nao precisa colocar v na frente
; 3. o 'g' cria um variável com g na frente para criar uma função, depois chama a função (function/label)
; 4. Submit = salva as informações
Gui dropd:New,, My window
Gui Add, DropDownList,vDropVariable, verde|rosa|vermelho|roxo
Gui Add, Edit, vEditVariable
Gui Add, Button, gShowVariables, Okay ; quando usuário clicar no botão, o gShowVariables vai chamar o código ShowVariables abaixo:

Gui Show
return ; 

ShowVariables:
Gui Submit, NoHide ; salva as informações nas variáveis, precisa usar Gui Submit primeiro para depois acessar infos do user(variáveis)
MsgBox % DropVariable
MsgBox % EditVariable
Return

;;;;;;;;;;;;;;

Gui notas:New,, Média das notas

; coluna dos textos
Gui notas:Add, Text, w75 right section, 1º semestre: 
Gui notas:Add, Text, w75 right, 2º semestre:
Gui notas:Add, Text, w75 right, 3º semestre:
Gui notas:Add, Text, w75 right, 4º semestre:
Gui notas:Add, Text, w75 right, 5º semestre:
; coluna para inserir notas
Gui Add, Edit, v1Semestre ys
Gui Add, Edit, v2Semestre
Gui Add, Edit, v3Semestre
Gui Add, Edit, v4Semestre
Gui Add, Edit, v5Semestre
; btoao para calcular
Gui Add, Button,  xs gCalculo, Okay ; vai ser na mesma posição X do primeiro control para ficar alinhado na esquerda
; função gCalculo que toda vez que for clicado nesse botão vai ser chamado essa função

Gui notas:Show ; chamar a janela
return 

Calculo:
Gui Submit, NoHide ; com isso todas variáveis vão ser salvas
media := (1Semestre+2Semestre+3Semestre+4Semestre+5Semestre)/5

if(media > 80)
	MsgBox suas notas estao cima da media
else
	MsgBox suas notas estao abaixo da media

return

; label = Calculo: codigo aqui Return
; Function Calculo(param1, param2, param3){codigo aqui return}
; melhor é usar labels com guis porque labels pode acessar global variables e function nao

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; AÇÕES AUTOMÁTICAS DO AUTOHOTKEY QUE PODEMOS CAPTURAR

; Capturar o evento de fechar janela que é executado pelo autohotkey automaticamente (GuiClose)
; Capturar o evento de pressionar Esc(Escape) no teclado

Gui janela0:New,, closing teste
Gui janela1:New,, closing teste

Gui janela0:Show, w500 h500
Gui janela1:Show, w500 h500
return

janela1GuiClose:
janela2GuiClose:
janela1GuiEscape: ; a ação GuiClose, colocamos o nome da gui antes 
janela2GuiEscape: ; ação de pressionar escape vai ter o mesmo efeito de clicar no fechar
MsgBox VC clicou no fechar ou apertou esc ; exibe msgbox ao clicar no fechar
ExitApp ; fecha a janela dps da msgbox
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; GUI SIZE
; Podemos saber se a janela foi minimizada, maximizada, ou padrão

; GuiSize:
; Pode capturar: MsgBox % A_GuiWidth A_Tab A_GuiHeight A_tab A_EventInfo
; A_EventInfo retorna um número de 0 a 2 (0 = padrao aberto) (1= minimizado) (2=maximizado)
Gui New, +Resize
Gui Show, w500 h500
return

GuiSize:
tooltip % "Altura: " A_GuiHeight "Largura: " A_GuiWidth ; exibe tooltip, ótimo


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; AÇÃO DE ARRASTAR ARQUIVOS PRA janela
Gui New,, drop files
Gui Show, w500 h500
return

GuiDropFiles:
MsgBox % A_GuiEvent ; ver o que o script ve
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pode definir default no control Button, dessa forma ao pressionar Enter no teclado ele é acionado
; Definir uma hotkey para pressionar o botão basta usar $ antes da letra que deseja usar como hotkey
Gui Add, Button, w75 x10 y10 gOkay Default, Okay
Gui Add, Button, w75 x+10 gCancel, &Cancel ; a letra c no programa fica com um underline e se pressionar ALT+C vai ser executado
Gui Show
return

Okay:
MsgBox PRESSIONOU Ok
return

Cancel:
Gui hide ; esconde janela
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;; CRIAR CONTROL TEXT E LINHA SEPARADORA

; TEXT = criar uma linha separadora
; Acessar special options do text na documention: 
; https://www.autohotkey.com/docs/commands/Gui.htm
; https://www.autohotkey.com/docs/commands/Gui.htm#OtherOptions
; https://www.autohotkey.com/docs/misc/Styles.htm
; https://www.autohotkey.com/docs/misc/Styles.htm#Text

Gui New
Gui Margin, 0 ; define margem 0

Gui Add, Text, +0x10 y200 w400 ; 0x10 = linha separadora (colocar + é opcional, boa prática) - divisor
Gui Add, Button, w75 x230 yp+10, Okay
Gui Add, Button, w75 x+10, Cnacel


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;; CRIAR CONTROL Edit - LOWERCASE UPPERCASE - AREA GRANDE DE TEXTO - NÚMEROS - LIMITAR ENTRADA DE CARACTERES
Gui Add, Edit, w100, Default Text
Gui Add, Edit, w100 r10 ; permite várias linhas de texto, area grande de texto basta especificar quantas linhas/rows r10
Gui Add, Edit, w100 Lowercase ; texto em caixa baixa
Gui Add, Edit, w100 uppercase ; texto em caixa alta

Gui Add, Edit, w100 number ; forçar apenas números
Gui Add, Edit, w100 Password ; senha, pode digitar Password* a senha fica em *

Gui Add, Edit, w100 password limit5 ; limitar maximo de caracteres em 5

Gui Add, Button, w75 Default gpush, Okay
Gui Show
Return

push:
MsgBox pushed
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;; CONTROL LINK 
Gui Add, Link,, this will take me to <a href="www.autohotkey.com">autohotkey.com</a> ; abre o site
Gui Add, Link,, this will take me to <a href="notepad.exe">NOTEPAD PROGRAM</a> ; abre o notepad
Gui Show
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;; CONTROL HOTKEY

; descobrir hotkey do que vc colocar
Gui Add, Hotkey, w100 vMyHotKey, ^!space ; vc definiu uma hotkey padrão para mostrar (^!espace) mas pode deixar vazio se quiser
Gui Add, Button, w75 x+10 gHotKey, show Hotkey
Gui Show
Return

HotKey:
Gui Submit, NoHide
MsgBox % MyHotKey
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;; CONTROL image - ADICIONAR IMAGENS

; descobrir hotkey do que vc colocar
; preservar o ratio da imagem basta especificar o width ou height normalmente e colocar h-1 ou w-1 pra preservar tamanho
Gui Add, Picture,w100 h-1 gPushed, button.png ; vc esta especificando o nome do arquivo sem o caminho completo o script entende que o arquivo esta no mesmo local do script
Gui Show
return
Pushed:
MsgBox o botão foi pressionado a imagem
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;;;;;;;; PROJETO APP.MOQUPS.COM

; https://app.moqups.com/Zd7iAQVBgY/edit/page/ad64222d5

; 1º criar todos controls e elementos da tela e só depois ajustar posições etc

Gui Add, Text,, Open File:
; cria uma seção section para salvar a posição do primeiro control abaixo
Gui Add, Edit,Section w300 vSelectionEdit, %a_mydocuments% ; não vai ser usado pelo usuário, vai só mostrar o caminho dos documentos
Gui Add, Button, x+10 yp-1 w75 gOpenFile, &Browse.... ; x+10 ficar alinhado a direita yp-1 para resolver alinhamento do botão que não está exatamente alinhado com o control anterior
Gui Add, Edit, xs y+10 w375 r10 vEditor ; xs para usar a posição salva no section e y+10
Gui Show
Return

OpenFile:
FileSelectFile, vFile, 3, %a_mydocuments%, Select Text File, *.txt
FileRead, fileText, %vFile%

GuiControl,, SelectionEdit, %vFile%
GuiControl,, Editor, %fileText%




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONTROL RADIO Button
; define uma variável para somente um deles
; group
; checked
; checked0 = não selecionado
; checked1 = selecionado
; checked0 e checked1 é importante pois vc ter variável que tem números 0 ou 1 para ter o controle pre selecionado (util qudo tem settings.ini file que armazena info de como tava qdo usuario fechou prog)
; pode adicionar label em cada radio gutton, gRadio

Gui New
Gui Add, Radio vRadioSelection,, Option 1
Gui Add, Radio,checked, Option 2
Gui Add, Radio,, Option 3
Gui Add, Radio,, Option 4
Gui Add, Radio,, Option 5
; criar um grupos de radio basta criar outro control abaixo
Gui Add, Text, this text separate
Gui Add, Radio, group, Option 1 ; aqui novo grupo de radiobuttons, adicionar group
Gui Add, Radio,, Option 2
Gui Add, Radio,, Option 3
; ter grupos de radiobuttons sem adicionar outro control basta adicionar um group no prox grupo de radios


Gui Add, Button, w75 gShow, show Selection
Gui Show
return
Show:
Gui Submit, NoHide
MsgBox % RadioSelection

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONTROL CHECKBOX = DIFERENÇA É QUE PODE SELCIONAR VÁRIOS AO MESMO TEMPO
; checked
; checked3 = 3 diferentes estados = clicar 3 vezes para ver (ñ marcado, marcado, nada)
; checked0 = não checado
; checked1 = checado
; cheched-1 = grayout
; colocar variavel no checked igual pode fazer com radio

Gui, Add, Checkbox,checked%var% gPressed, Option 1
Gui, Add, Checkbox,checked%var% gPressed, Option 2
Gui, Add, Checkbox,checked%var% gPressed, Option 3
Gui Show
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONTROL UpDown - spinner
; left
; 50 = valor padrao
; range1-50 ; pode colocar numero negativo tambem
; wrap = ao atingir o limite do range, começa do começo

Gui New
Gui Add, Edit, w75
Gui Add, UpDown, left, 50 ; valor padrão que pode colocar no control, left - vc troca posição do spinne

Gui Add, Edit, w75 vEditVar ; variavel independente
Gui Add, UpDown, range-10-50 wrap vUpDownVar ; valor padrão que pode colocar no control, left - vc troca posição do spinner

Gui Add, Button, w75 gShowVar, show variables

Gui Show
return

ShowVar:
Gui Submit, NoHide
MsgBox % EditVar a_Tab UpDownVar

GuiClose:
Exit

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONTROL DropDownList
; separar por |
; presselecionar uma opção basta colocar dois | ou choose3 (seleciona 3ª opção)
; UPPERCASE LOWERCASE
; sort = organiza alfabetico

Gui Add, DropDownList, w100 lowercase sort choose%var% gShow vDDVar, red|blue|ola|oq||queisso
Gui Show
return
Show:
Gui Submit, NoHide
MsgBox % DDVar
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONTROL ComboBox
; igual DropDownList diferença é que em vez de clicar pode escrever
; pode colocar quantas linhas quer exibir, r2 , depois disso cria scrollbar

Gui Add, Combobox, w100 vCBVar r2, Option|Option2|Option3
Gui Add, Button, w75 gShowVar, show
Gui Show
return

ShowVar:
Gui Submit, NoHide
MsgBox % CBVar
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONTROL Slider
; valor padrao 50
; range padrão é 0-100
; tooltip, tooltipbottom
; center significa que o icone azul do slider nao vai ter ponta
; tickinterval = coloca pontos pra vc clicar e mover
; noticks = sem pontos em baixo
; vertical
; left
; line10 = seta do teclado move 10 pra o lado
; page50 = usando tecla pageup pagedown move 50
Gui Add, Slider, w100 tooltip, 50 ; valor padrao 50, tooltip mostra o número que tá sendo alterado
Gui Add, Slider, w200 range1-50 tooltipbottom, 50 ; pode ajustar o range o default range é 0-100
Gui Add, Slider, w200 tooltip center, 50 ; center significa que o icone azul do slider nao vai ter ponta
Gui Add, Slider, w200 tooltip center tickinterval20, 50 ; tickinterval a cada 20 passos assim vc pode clicar e mover
Gui Add, Slider, w200 tooltip center noticks, 50 ; sem ticks em baixo
Gui Add, Slider, h200 tooltip vertical left x+10 ys, 50 ; slider em pé
Gui Add, Slider, w200 xs y+10 line10 range1-50, 50 ; line10 = seta do teclado move 10 pra o lado

Gui Show
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONTROL DateTime
; Time / LongDate
; pode usar range de datas no calendário quando vc clica
; 1 = subir descer 2 = checkbox
; Procurar na documentação format time: https://www.autohotkey.com/docs/commands/FormatTime.htm

Gui Add, DateTime, vDateVar w200 range20200901-20200910, MM/dd HH:MM tt
Gui Add, DateTime, 1 ; subir e descer data
Gui Add, DateTime, 2 ; checkbox
Gui Add, DateTime, choose20151001; checkbox
Gui Add, Button, w75 gShowDate, Show
Gui Show
return

ShowDate:
Gui Submit, NoHide
MsgBox % SubStr(DateVar,1,8) ; pega somente os 8 primeiros caracteres, vai ter o ano mes e dia somente, pois essa variavel mostra tudo independente se a pessoa colocou so hora mostra tudo
MsgBox % SubStr(DateVar,9,14) ; mostra somente o horario

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONTROL MonthCal
; esse só utiliza ano mes e dia, nao utiliza horario
; range 20200901-20200902
; multi = selecionar varias datas
; r3 = numero de linhas, vai mostrar mais meses verticalmente em baixo baixo
; w-2 = numero de linhas, vai mostrar mais meses horinzontalmente lado a lado

Gui Add, MonthCal, vDateSelected range20200901-20200902, 20201001-20201015
Gui Add, MonthCal, vDateSelected Multi r3
Gui Add, Button, gShowDate, Show DateTime
Gui Show
return

ShowDate:
GUi Submit, NoHide
MsgBox % DateSelected

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EXERCICIO HOTEL

; é só visual mas vc pode adicionars os labels variáveis e salvar e depoi salvar num arquivo por exemplo


Gui Add, Text,, First Name:
Gui Add, Edit, w150 Section, Name ; cria uma section no primeiro control para colocar o monthcal em outra coluna
Gui Add, Text,, Last Name:
Gui Add, Edit, w150, Last Name

Gui Add, Text,, Number of Rooms:
Gui Add, DropDownList, w150 , 1|2|3|4|5
Gui Add, Text,, Number of Guests:
Gui Add, DropDownList, w150 , 1|2|3|4|5

Gui Add, GroupBox, h75 , OPTIONS ; h100 ajusta altura do checkbox pois tava faltando o parking
Gui Add, Checkbox, xp+10 yp+20, Smoking Allowed ; mesma localização y do groupbox + 20 pixels (yp+20) | xp+10 = posição x do control anterior + 10pixels
Gui Add, Checkbox,, Pets Allowed ; esses não precisa do yp+20 pois seguem a mesma localização do control anterior
Gui Add, Checkbox,, Parking ; esses não precisa do yp+20 pois seguem a mesma localização do control anterior

Gui Add, MonthCal, ys ; usa o ys que é a posição que foi salva do Section
Gui Show

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SEPARAÇÃO DE CONTROLS - GROUPBOX
Gui Add, GroupBox, w100 h100 section, Image Settings
Gui Add, Checkbox, xs+10 ys+10, Option1
Gui Add, CheckBox, y+10 , Option2
Gui Add, Checkbox, y+10, Option3

Gui Show
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SEPARAÇÃO DE CONTROLS - POR TABS - EXCELENTE
; tem 3 tipos diferentes de tab, mas vamos usar tab3
; pode criar varias tabs e separar os controls das tabs usando Gui Tab, nomeTab
; tab3 calcula o width height automaticamente se não especificarmos
; left right bottom, coloca a tab em outra posição
; os controls s

Gui Add, Tab3, vTabVariable gShowVar left, Tab1|Tab2|Tab3|Tab4 ; cria várias tabs

Gui Add, Tab3,, Videos|Images|Links ; cria várias tabs

Gui Add, Edit
Gui Add, Edit
Gui Add, Edit
Gui Add, Button, w75, teste
Gui Add, Button, w75 x+10, Cancelar

Gui Tab, Images ; agora vem os controls da tab images
Gui Add, Button, w75, One
Gui Add, Button, w75, Two
Gui Add, Button, w75, Tree
Gui Add, Edit
Gui Add, Edit

Gui Show
Return

ShowVar:
Gui Submit, NoHide
MsgBox % TabVariable ; mostra o nome da tab
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; LISTA DE OPCOES  CAIXAS

; LISTBOX = dropdownlist sem ter que clicar no botao para ver as opcoes
; multi = ctrl ou shift
; 8 no lugar de multi = permitir multipla selecao sem ctrl e shift (usando mouse)
; sort = organzia alfabetico
; readonly = nao aparece marcado em azul, mas fica selecionado

Gui Add, ListBox, w100 h200 multi sort gShowVar vLBvar, Option1|Option2||Option3||OPtion4
Gui Show
return

ShowVar:
Gui Submit,Nohide
MsgBox % LBvar
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; TreeView

; parent e children = windows explorer tem treelist (pastas dentro de pastas)
; depois de criar o control vc precisa de funçoes para modificar o control
; -button: remove o icone+ da treeview
; checked : adicoinar checkbox na lista
; -readonly = permite editar os nomes pressionando F2
; -lines = remove as linhas
; AltSubmit = retorna normal se o usuario clicou no item, rightclick se deu rightclick, E = começou editar o item

Gui Add, Treeview, -button checked -readonly -lines AltSubmit gTreeLabel
Gui Add, Button, gTreeLabel2, Run Function
; funç'ao TV_Add para adicionar items no control treeview, tem 3 parametros mas so o primeiro eh mandatorio, os outros dois sao opcionais
; 1º parametro eh o texto do item - 2º parametro eh o id do parent item se tiver - 3º parametro sao as opcoes para este item em particular
P1 := TV_Add("General", 0, "check") ; TV_Add("General", 0, <options>)colocar 0 torna este item top level item
P2 := TV_Add("Videos", 0, "expand") ; quando o TV_Add funcao eh usado ela retorna o id do novo item adicionado ou 0 se falhar, armazenando o id numa variavel P2
P3 := TV_Add("Images")

; Apos adicionar os items voce pode modifica-los com a funcao TV_Modify()
; TV_Modify(id, options, ]text]) ; 3 parametros 1º id do item que quer modificar 2º opcoes do item 3º mudar o texto do parametro
; retorna o id do item ou 0 se der ruim
TV_Modify(P1, "bold")
; OPTIONS:
; "bold" = fica negrito, se quiser tirar, executa de novo com "-bold"
; check = deixa a treeview marcada com check
; expand = espande os children , desabilitar -expand
; sort = organiza alfabetico
; select = deixar um item selecionado quando adicionado

TV_Add("Option1", P1, "select")
TV_Add("Option2", P1)
TV_Add("Option1", P2)
TV_Add("Option2", P2)
TV_Add("Option1", P3)
TV_Add("Option2", P3)

; FUNCAO TV_DELETE SO TEM 1 PARAMETRO OPCIONAL
TV_Delete() ; deleta todos itens da treeview
TV_Delete(P3) ; colocar o id do item como parametro

Gui Show
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; PEGAR INFORMAÇOES
; GetParent retorna o id do parent, se usar num item parent retorna 0
; TVGetSelection - retorna o id do item selecionado agora, não tem parametros
; TvGetChild retorna o id do primeiro child do item que passamos para parametro se vc colocar um item que nao tem child, retorna 0
; TV_GetPrev()  retorna o id do previous sibling/irmao do item que foi passado como parametro
; TV_GetNext() recebe 2 parametros, 1º o id do item que quer checar 2ºtipo de itens que quer retornar se vc passar so o id do item vai retornar o prox irmao, se colocar full no segundo argumento vai retornar o prox item(independete se for sibling/parent/child). Se usar check ou c retorna o prox item que tem checkbox marcado
; TV_GetText() pode retrieve/recuperar o nome de um item em vez do id, recebe 2 parametros - 1º variavel para armazenar o texto que vai ser recuperado do id que quer checar, 2º parametro é o id do item que quer checar
TreeLabel2:
sel:= TV_GetSelection() ; MsgBox % TV_GetSelection() ; retorna o id do item que esta selecionado no momento, ao clicar no botao run fucntion. 'N TEM PARAMETROS'
MsgBox % TV_GetCount() ; retorna o numero de itens da TreeView
MsgBox % "Current Selection: " sel "`nParent: "TV_GetParent(sel) "`nChild: "TV_GetChild(TV_GetSelection())
TV_GetText(itemName, TV_GetSelection())
MsgBox % itemName
TreeLabel: ; treeview nao precisa do submit nao precisa criar variavel pra esse control
msgBox % A_GuiEvent ; contem a açao do usuario: ex: doubleclique retorna 'e' se o usuario terminou de editar um item(so funciona se tiver -readonly na treeview). Retorna S se item foi selecionado
msgBox % A_EventInfo ; contem o id do item


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; ListView
; MODO REPORTING VIEW
;;; É MAIS AVANÇADO DOS CONTROLS, PARECIDO COM TREEVIEW MAS É USADO PARA DISPLAY ROWS AND COLUMNS DE DATA/DADOS

;;; NÃO PRECISA DE GUI SUBMIT TAMBÉM
; Checked - pode adicionar ao lado do w300 h300 vai adicionar checkboxes
; Grid - adiciona linhas separadoras nas linhas e colunas
; SortDesc or Sort
; -readonly - pode editar a primeira coluna pressionando F2
; Como não usa GUISUBMIT não precisa adicionar variables

Gui Add, ListView, w300 h300, Name|Size|Date Modified
LV_Add("", "Item1", "500MB", a_now)
LV_Add("", "Item2", "500MB", a_now)
LV_Add("", "Item3", "500MB", a_now)
LV_Add("", "Item4", "500MB", a_now)

Gui Show
return


; LIST VIEW MODES : 5	

; 1º REPORTING MODE É O MODO PADRÃO QUE MOSTRA COLUNAS E LINHAS COM AS INFORMAÇÕES
; 2º ICON MODE: mostra icones e o texto embaixo do icone, colunas com info sao ignoradas
; 3º ICON SMALL MODE: mesma visualização mas com icones menores
; 4º TILE MODE: mesma do anterior só que o texto é o mostrado ao lado do icone e nao embaixo
; 5º LIST MODE: Vai ser listado em colunas com icones e texto ao lado

; REPORTING MODE VOCÊ PODE ARMAZENAR INFORMAÇÕES SOBRE OS ICONES, LOCALIZAÇÃO, ESTADO, TAMANHO DO ARQUIVO, 

; check
; Focus - foco no selecionado
; select - já fica selecionada com foco
; col - pode ignorar informações de colunas, deixar em branco
; vis - assegurar que a linha especifica que vc quer esteja visivel ao executar o programa, vai estar na sua visualização sem precisar usar scroll


Gui Add, ListView, w300 h300, Name|Size|Date Modified
LV_Add("check focus select", "Item1", "500MB", a_now)
LV_Add("col2", "500MB", a_now) ; ignora coluna 1, toda info começa onde vc especificou (col2)
Loop 50
	lista := LV_Add("", "Item" a_index, "500MB", a_now)
LV_Modify(lista, "vis") ; a linha 50 fica visivel

; Função LV_Insert() funciona igual LV_Add mas o primeiro parametro indica qual vai ser a linha que vc vai inserir, numero
; muito util quando a listview ja foi criada e vc quer adicionar uma linha numa localização específica
LV_Insert(3, "check", "Inserted on the 3rd")

; A FUNÇÃO LV_Modify() é usada para modificar as OPTIONS ou TEXT de uma linha específica
; 1º parametro é o numero da linha que quer modificar
; 2º parametro é as options da linha especifica que quer
; 3º parametro é o texto que quer modificar das colunas, pode modificar o texto de todas clunas
LV_Modify(3, "-check", "Modified the textt", "1MB")

; FUNÇÃO LV_Delete() usada para remover uma linha
LV_Delete(4) ; remove a linha 3, se deixar em branco deleta todas linhas

Gui Show
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ACIMA VIMOS COMO MODIFICAR AS LINHAS, ABAIXO VEREMOS COMO MODIFICAR AS COLUNAS

; LV_ModifyCol() se deixar vazio sem parametros, todas colunas vão ser modificadas, tem 3 parametros
; 1º parametro é o numero da coluna que quer modificar

; 2º parametro é as options que quer: 
; 300(width/pixels) "auto" = se ajustar ao conteúdo "autoHDR" = igual ao auto mas considera o texto dos headers também
; "float" = conteudos dessa coluna vao ser float que contem decimal, "integer" = numeros inteiros, "text" = organizar alfabeticamente
; "text right", "text center" "text left" = justificar local do texto

; 3º parametro é o texto que quer na coluna

Gui Add, ListView, w300 h300, Name|Size|Date Modified
LV_Add("check focus select", "Item1", "500MB", a_now)
LV_Add("col2", "500MB", a_now) ; ignora coluna 1, toda info começa onde vc especificou (col2)
Loop 50
	lista := LV_Add("", "Item" a_index, "500MB", a_now)
LV_Modify(lista, "vis") ; a linha 50 fica visivel

LV_ModifyCol(1, "", "", "This is a very long text here") ; todas as colunas vão se ajustar para aos conteúdos
LV_ModifyCol(2, "auto", "Modified Size Column") ; nas options colocamos 300 que é o width/pixels da coluna
Gui Show
return