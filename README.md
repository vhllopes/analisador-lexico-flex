# 📌 Nome do Projeto: Analisador Léxico com Flex

## 📖 Descrição
Este projeto é um analisador léxico desenvolvido para a disciplina de Compiladores. Utilizando a ferramenta **Flex**, ele processa um arquivo de código-fonte de uma linguagem de programação customizada e o converte em uma sequência de tokens. O analisador identifica palavras-chave, identificadores, literais, operadores e erros, exibindo a linha de cada ocorrência.

---

## 🛠️ Tecnologias Utilizadas
- **C**: Linguagem base para o código gerado e a função `main`.
- **Flex**: Ferramenta geradora de analisadores léxicos.
- **GCC**: Compilador C utilizado para criar o programa executável.
- **Make**: Ferramenta para automatizar o processo de compilação.

---

## 📁 Estrutura de Pastas
```bash
.
├── Makefile          # Automatiza a compilação do projeto
├── bin/
│   └── analisador    # Arquivo executável (gerado após a compilação)
├── src/
│   └── analisador.l  # Arquivo de definição das regras léxicas para o Flex
├── tests/
│   └── fonte.txt     # Código de exemplo para teste
└── README.md         # Este arquivo
```

## 🚀 Instalação e Uso

### 🔹 Pré-requisitos
Antes de começar, certifique-se de que você tem o **flex**, **gcc** e **make** instalados.

**Para sistemas baseados em Debian/Ubuntu:**
```bash
sudo apt-get update
sudo apt-get install flex build-essential
```

###Instalação e Compilação
Clone o repositório para sua máquina local:
```bash
git clone <URL_DO_REPOSITORIO>
```
Navegue até a pasta do projeto:
```bash
cd <DIRETÓRIO_DO_PROJETO>
```
Execute o comando make para compilar o projeto:
```bash
make
```
O executável analisador será criado no diretório bin/.

## ✅ Rodando os Testes
Para executar o analisador, você precisa fornecer um arquivo de código-fonte como argumento. Um arquivo de teste de exemplo está localizado em tests/fonte.txt.

Execute o seguinte comando a partir da raiz do projeto:

```bash
./bin/analisador ./tests/fonte.txt
```

A saída mostrará:
 * A lista de tokens encontrados
 * Qualquer erro léxico
 * A linha de cada ocorrência

## ✨ Funcionalidades
* [x] Reconhecimento de palavras-chave da linguagem.

* [x] Identificação de operadores aritméticos e relacionais.

* [x] Classificação de literais (inteiros, reais e texto).

* [x] Análise e validação de identificadores (variáveis e funções).

* [x] Contagem de linhas para localização precisa de tokens e erros.

* [x] Emissão de mensagens de erro para caracteres inválidos.

* [x] Suporte para ignorar comentários de linha única (//).




## 👥 Autores
**Vítor Hugo Lellis Lopes**   

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/vhllopes)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/vhllopes)


**Breno Marques Bernal**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/breno-bernal)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/brenobernal40)