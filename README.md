# Instalação manual
Basta copiar ambos os scripts *install.sh* e *exporte.sh* (esse script contem variáveis  e só esta disponível depois de cópia feita pelo Travis CI) para qualquer diretório para o servidor e executar apenas o *install.sh* (com sudo, para usuários com permissão) 
> :~$ sudo ./install.sh

# Automatizando MinIO Upload by Travis CI
Para realizar a automação dessa instalação ou atualização automática, a minha escolha foi pelo Tavis CI, eu sei recursos do Travis CI para proteger as senhas e a chave SSH de acesso ao servidor criptografando os arquivos e protegendo usuário e o IP do servidor, fazendo assim possível alterar os dados de acesso para realizar uma instalação em novo servidor. Para isso o script *install.sh* foi incrementado com validações para que remover arquivos  e processos que possam impedir a atualização.
