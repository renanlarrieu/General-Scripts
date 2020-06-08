GFRJ_AeroPy vers�o 3:

Melhorias/corre��es em rela��o a vers�o anterior:
* nesta vers�o usa-se o cd do aerolab (variando em fun��o de Mach) ou um valor cd m�dio chutado, enquanto na vers�o 2 usava-se apenas cd m�dio). 
(foi utilizado regress�o n�o linear de ordem 6 para aproxima��o de cd com mach.)
* adicionado equa��o de temperatura com altitude (v�lida na troposfera h < 11km) e velocidade do som, para obter Mach.
fontes que serviram de base para os c�lculos:
https://www.grc.nasa.gov/www/k-12/airplane/atmosmet.html
http://s6.aeromech.usyd.edu.au/aerodynamics/index.php/sample-page/properties-of-the-atmosphere/table-of-atmospheric-properties/
https://en.wikipedia.org/wiki/Speed_of_sound

Uso do programa:
1) Abrir o onfig.ini pela IDE ou como arquivo de texto, digitar os dados de entrada e salvar.
2) Abrir o GFRJ_PY.
3) Copiar dados da curva de empuxo da planilha nakka e colar na planilha da pasta 'CurvaDeEmpuxo' mantendo nome das colunas 't1' e 'T1' (caso mude, aleterar no c�digo).
4) Para usar um empuxo m�dio e n�o os dados da curva, na linha 33 coloque True.
5) Para uma primeira an�lise, utilize um cd m�dio: na linha 32 coloque True. Sugest�o:
valores entre 0,3 a 0,5 para foguetes potentes (high power rocket) e entre 0,5 a 0,7 pra foguetes menos potentes.
6) Escolhido o motor, fa�a o projeto da geometria do foguete no aerolab, exporte o gr�fico cd vs mach e coloque nesta pasta. Troque cd m�dio para False.
(renomei "EXPORT_irec" para o projeto atual, n�o esque�a de colocar tamb�m o mesmo nome na linha de c�digo (linha 96).

IDEs:
Anaconda spyder (free) - https://www.anaconda.com/download/      (IDE recomendada)
Pycharm Community (free) - https://www.jetbrains.com/pycharm/download/ 

===================================
Grupo de Foguetes do Rio de Janeiro

























