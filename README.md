# 🚀 Ambiente de Desenvolvimento com Docker

Este repositório contém um dockfile de um ambiente de desenvolvimento baseado, configurado para Python, Rust e Node.js. Além disso, há scripts para facilitar a criação e execução do contêiner com suporte ao X11, permitindo rodar aplicações gráficas no Linux.

## 📌 Tecnologias Instaladas

- **Ubuntu 24.04**
- **Python (python3-full + pip)**
- **Rust (via rustup)**
- **Node.js (via repositório oficial)**
- **Git**

## 📂 Estrutura do Repositório

```
📁 docker-dev-env/
│── 📄 Dockerfile        # Configuração do ambiente no Docker
│── 📄 create_container.sh  # Script para criar o contêiner
│── 📄 run_container.sh  # Script para rodar o contêiner com suporte ao X11
│── 📄 README.md         # Documentação do projeto
```

## 🛠️ Configuração e Uso

### 🔹 1. Construindo a Imagem Docker

```bash
./create_container.sh
```

### 🔹 2. Criando o Contêiner com Suporte ao X11

Para executar o contêiner e permitir o uso de aplicativos gráficos no Linux, utilize o script `create_container.sh`:

```bash
./run_container.sh
```

Esse script configura automaticamente o display para o X11, permitindo que aplicativos gráficos sejam executados dentro do contêiner além de adicionar um bind mount para persistencia de arquivos.

OBs.: O script tambem nomeia o conteiner, se deseja criar mais de um container, alterar a linha 2 do script:
```bash
--name dev-container 
```

## 🏷️ Notas Importantes

- O suporte ao X11 funciona apenas em sistemas Linux com um servidor gráfico ativo.
- Caso tenha problemas com permissões do X11, execute esse comando no host e tente novamente:
  ```bash
  xhost +local:docker
  ```