#ubuntu initial 12.4 / wubi.exe
#native c++, but I need use boost. Only.
sudo apt-get install boost*
#http://www.boost.org/


É necessário uma série de configurações para o openmp no eclipse.
Instalar um novo container chamado TDM 
http://tdm-gcc.tdragon.net/
http://xcodelovers.wordpress.com/2011/02/01/tutorial-installing-tdm-gcc-windows/

Configurar o eclipse foi difícil
Primeiro instalei o mingw via mingw-installer. Inclusive ele está no path do windows, digamos em segundo plano, e existe a possibilidade de fazer alguma diferença.
Mas, o gcc em execução, com certeza, é do TDM. Que não possui configuração padrão para o make, que gera um erro em projetos default do eclipse. É necessário configurar o build corrente conforme imagem neste diretório.