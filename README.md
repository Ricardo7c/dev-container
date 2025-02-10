# Container Docker para Ambiente de Desenvolvimento

Este repositório contém um Dockerfile para configurar um ambiente de desenvolvimento completo com diversas ferramentas e linguagens, incluindo Rust e Python. O contêiner é baseado no Ubuntu 24.04 e está configurado para usar o usuário root com uma senha padrão.

## Estrutura do Dockerfile

O Dockerfile realiza as seguintes tarefas:
1. Utiliza a imagem base do Ubuntu 24.04.
2. Evita interações durante a instalação definindo a variável `DEBIAN_FRONTEND` como `noninteractive`.
3. Atualiza os pacotes e instala diversas ferramentas essenciais, incluindo `curl`, `git`, `python3-full`, `python3-pip`, `build-essential`, `ca-certificates`, `lsb-release`, `sudo`, `gnupg2`, `wget`, e `nano`.
4. Instala o Rust e adiciona seu caminho (`PATH`).
5. Define uma senha padrão para o usuário root.
6. Define o diretório de trabalho como `/home/Dev`.
7. O comando padrão ao iniciar o contêiner é `/bin/bash`.

## Dockerfile

```Dockerfile
# Usando uma imagem base do Ubuntu
FROM ubuntu:24.04

# Evita interações durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualiza os pacotes e instala as ferramentas necessárias
RUN apt update && apt install -y \
    curl \
    git \
    python3-full \
    python3-pip \
    build-essential \
    ca-certificates \
    lsb-release \
    sudo \
    gnupg2 \
    wget \
    nano \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Instalar Rust para o root
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Adicionar Rust ao PATH do root
ENV PATH="/root/.cargo/bin:${PATH}"

# Define uma senha padrão para o root
RUN echo 'root:1234' | chpasswd

# Define o usuário padrão como root
USER root

# Definindo o diretório de trabalho dentro do container
WORKDIR /home/Dev

# Comando padrão ao rodar o container
CMD ["/bin/bash"]
```

## Como Usar

### Construir a Imagem Docker

Para construir a imagem Docker a partir do Dockerfile, execute o seguinte comando no diretório onde o Dockerfile está localizado:

```sh
docker build -t dev-container .
```

### Executar o Contêiner

Para criar e executar o contêiner, use o comando abaixo. Isso irá mapear a porta 8080 do contêiner para a porta 8080 do host, permitir a execução interativa e montar o diretório `~/Dev` do host no contêiner.

```sh
docker run -d -it \
  --name dev-container \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v ~/Dev:/home/Dev \
  dev-container
```

### Conectar-se ao Contêiner

Para conectar-se ao contêiner em execução, use o comando:

```sh
docker exec -it dev-container /bin/bash
```

## Notas

- Certifique-se de que o servidor X11 esteja em execução no host e a variável DISPLAY esteja configurada corretamente.
- Para permitir que o contêiner Docker se conecte ao servidor X11, execute no Host:

```sh
 `xhost +local:docker` 
```

## Contribuição

Se você encontrar algum problema ou tiver sugestões de melhorias, sinta-se à vontade para abrir uma issue ou enviar um pull request.
