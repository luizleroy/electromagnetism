Apenas para o linker, inserir: gcc -Wl,--large-address-aware para utilizar mais de 2gB de mem�ria.

LEMBRAR QUE, NA �TLIMA AN�LISE, O INSTALADOR DO MINGW (NO DIRET�RIO CORRENTE, DESTE ARQUIVO README.TXT) FOI CAPAZ DE COMPILAR O SISTEMA COM OPENMP.

#ubuntu initial 12.4 / wubi.exe
#native c++, but I need use boost. Only.
sudo apt-get install boost*
#http://www.boost.org/


� necess�rio uma s�rie de configura��es para o openmp no eclipse.
Instalar um novo container chamado TDM 
http://tdm-gcc.tdragon.net/
http://xcodelovers.wordpress.com/2011/02/01/tutorial-installing-tdm-gcc-windows/

Configurar o eclipse foi dif�cil
Primeiro instalei o mingw via mingw-installer. Inclusive ele est� no path do windows, digamos em segundo plano, e existe a possibilidade de fazer alguma diferen�a.
Mas, o gcc em execu��o, com certeza, � do TDM. Que n�o possui configura��o padr�o para o make, que gera um erro em projetos default do eclipse. � necess�rio configurar o build corrente conforme imagem neste diret�rio.

Lembre-se: � IMPORTANTE adicionar, em plataformas 64 bits a flag -m32. Tando na compila��o quanto na linkedi��o.