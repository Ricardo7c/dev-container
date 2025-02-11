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
    xfce4-settings \
    xfce4-terminal \
    thunar \
    zsh \
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

# Tornar o zsh o terminal padrão
SHELL ["/bin/zsh", "-c"]

