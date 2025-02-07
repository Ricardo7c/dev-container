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
    && apt clean

# Instalar Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Usar Bash e fonte o ambiente do Rust
RUN /bin/bash -c "source $HOME/.cargo/env"

# Instalar Node.js (usando o repositório oficial para garantir a versão mais recente)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt install -y nodejs

# Verificando as versões para garantir que as instalações funcionaram
RUN /bin/bash -c "source $HOME/.cargo/env && rustc --version && python3 --version && node --version && git --version"

# Definindo o diretório de trabalho dentro do container
WORKDIR /root/Dev

# Comando padrão ao rodar o container
CMD ["/bin/bash"]

