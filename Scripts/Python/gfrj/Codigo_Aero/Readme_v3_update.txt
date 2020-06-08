GFRJ_AeroPy versão 3:

Melhorias/correções em relação a versão anterior:
* nesta versão usa-se o cd do aerolab (variando em função de Mach) ou um valor cd médio chutado, enquanto na versão 2 usava-se apenas cd médio). 
(foi utilizado regressão não linear de ordem 6 para aproximação de cd com mach.)
* adicionado equação de temperatura com altitude (válida na troposfera h < 11km) e velocidade do som, para obter Mach.
fontes que serviram de base para os cálculos:
https://www.grc.nasa.gov/www/k-12/airplane/atmosmet.html
http://s6.aeromech.usyd.edu.au/aerodynamics/index.php/sample-page/properties-of-the-atmosphere/table-of-atmospheric-properties/
https://en.wikipedia.org/wiki/Speed_of_sound

Uso do programa:
1) Abrir o onfig.ini pela IDE ou como arquivo de texto, digitar os dados de entrada e salvar.
2) Abrir o GFRJ_PY.
3) Copiar dados da curva de empuxo da planilha nakka e colar na planilha da pasta 'CurvaDeEmpuxo' mantendo nome das colunas 't1' e 'T1' (caso mude, aleterar no código).
4) Para usar um empuxo médio e não os dados da curva, na linha 33 coloque True.
5) Para uma primeira análise, utilize um cd médio: na linha 32 coloque True. Sugestão:
valores entre 0,3 a 0,5 para foguetes potentes (high power rocket) e entre 0,5 a 0,7 pra foguetes menos potentes.
6) Escolhido o motor, faça o projeto da geometria do foguete no aerolab, exporte o gráfico cd vs mach e coloque nesta pasta. Troque cd médio para False.
(renomei "EXPORT_irec" para o projeto atual, não esqueça de colocar também o mesmo nome na linha de código (linha 96).

IDEs:
Anaconda spyder (free) - https://www.anaconda.com/download/      (IDE recomendada)
Pycharm Community (free) - https://www.jetbrains.com/pycharm/download/ 

===================================
Grupo de Foguetes do Rio de Janeiro

























