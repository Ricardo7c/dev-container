## Documentação do Repositório Docker de Ambiente de Desenvolvimento

Este repositório contém um Dockerfile e scripts que utilizo para criar meu ambiente de desenvolvimento. O ambiente é baseado no Ubuntu 24.04 e inclui ferramentas essenciais para o meu uso como Python, Rust e nodejs.

### Objetivo
O intuito desse projeto foi aprender a trabalhar com containers e como bonus mantenho meu sistema host limpo.

### Construindo a Imagem

1.  Clone este repositório.
2.  Navegue até o diretório do repositório no terminal.
3.  Execute o script `create_image.sh`:

```bash
sudo ./create_image.sh
```

Este script irá construir a imagem Docker com o nome `dev-container`.

### Criando e Iniciando o Container

1.  Após a construção da imagem, execute o script `create_container.sh`:

```bash
./create_container.sh
```

Este script irá criar e iniciar o container Docker com o nome `dev-container`. Ele também configura o display para permitir o teste de aplicações com interface grafica e monta o diretório `~/Dev` do host no diretório `/home/Dev` dentro do container, permitindo a persistência dos arquivos.

### Acesso ao Container

Após a execução do script `create_container.sh`, o container estará em execução em segundo plano. Para acessar o container, você pode usar o seguinte comando:

```bash
docker exec -it dev-container bash
```

### Configurações

*   **Usuário:** O usuário padrão dentro do container é `root`.
*   **Senha:** A senha padrão para o usuário `root` é `1234`.
*   **Diretório de Trabalho:** O diretório de trabalho padrão dentro do container é `/home/Dev`.
*   **Interface Gráfica:** A interface gráfica XFCE está disponível.
*   **Ferramentas:** O ambiente inclui Python 3, Rust, Zsh, Git, curl, wget, nano,thunar e uma base da interface xfce4 para rodar programas com interface grafica.

### Observações

*   Certifique-se de ter o Docker instalado em seu sistema antes de executar os scripts.
*   O script `create_container.sh` monta o diretório `~/Dev` do host no diretório `/home/Dev` dentro do container. Certifique-se de que este diretório exista em seu host antes de executar o script.
*   A senha padrão para o usuário `root` é `1234`. É altamente recomendável alterar esta senha após a criação do container.
* Certifique-se de que o servidor X11 esteja em execução no host e a variável DISPLAY esteja configurada corretamente.
  
- Para permitir que o contêiner Docker se conecte ao servidor X11, execute no Host:

```sh
 `xhost +local:docker` 
```

## Contribuição

Se você encontrar algum problema ou tiver sugestões de melhorias, sinta-se à vontade para abrir uma issue ou enviar um pull request.
