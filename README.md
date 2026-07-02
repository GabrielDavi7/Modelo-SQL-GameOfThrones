# GoT Facts - Banco de Dados de Game of Thrones

Este projeto foi desenvolvido para a disciplina de Banco de Dados do curso de Bacharelado em Ciência da Computação do Instituto Federal do Norte de Minas Gerais (IFNMG) - Campus Montes Claros. O sistema consiste na modelagem e implementação de um banco de dados relacional robusto focado no universo de _Game of Thrones_, gerenciando informações históricas e temporais sobre personagens, casas nobres, batalhas, grandes guerras, mortes, dragões e alianças.

## 📁 Estrutura do Projeto

O repositório contém os seguintes arquivos essenciais para a implementação física do banco de dados no PostgreSQL:

- **`Create.sql`**: Script DDL contendo a criação de todas as tabelas, definições de chaves primárias, chaves estrangeiras, restrições `CHECK`, valores `DEFAULT` e resoluções de dependências circulares.
- **`Insert.sql`**: Script DML contendo a carga inicial de dados de teste, garantindo o mínimo de 5 tuplas com sentido semântico real por relação.
- **`Consulta.sql`**: Script contendo a consulta principal obrigatória (recuperação de dados dos membros da Casa Stark) e consultas extras para a validação de relacionamentos do modelo.

---

## 🚀 Tutorial de Como Rodar o Projeto

Siga os passos abaixo para implantar o banco de dados e executar as consultas no seu ambiente local (PostgreSQL):

### 1. Pré-requisitos

- Ter o **PostgreSQL** instalado localmente.
- Um cliente de banco de dados de sua preferência (ex: pgAdmin, DBeaver ou terminal `psql`).

### 2. Criar o Banco de Dados

Abra o seu terminal ou cliente SQL e crie um banco de dados vazio para o projeto:

```sql
CREATE DATABASE got_facts;
```

### 3. Execução dos Scripts (Ordem Obrigatória)

Para que as chaves estrangeiras e as restrições funcionem sem erros de dependência, execute os arquivos rigorosamente na seguinte ordem:

1. **`Create.sql`**: Cria toda a estrutura de tabelas e restrições.
2. **`Insert.sql`**: Povoa o banco de dados com os registros de teste do mini-mundo.

_(Dica: Caso precise reiniciar os testes ou limpar o banco de dados, o arquivo `Insert.sql` possui um bloco de comandos `DELETE` no topo ordenado especificamente para limpar as tabelas sem violar restrições de integridade)._

### 4. Executar a Consulta Principal

Com o banco criado e povoado, abra e execute o arquivo **`Consulta.sql`**.

A consulta principal irá cruzar as tabelas usando `LEFT JOIN` para recuperar o relatório exigido:

- Membros da Casa Stark
- Batalhas e Guerras das quais participaram
- Vítimas que assassinaram, incluindo as respectivas armas e descrições das mortes

A execução bem-sucedida deve retornar exatamente um relatório com os registros dos personagens Stark (como Ned, Jon, Arya, Robb, Bran, Catelyn e Rickon), exibindo valores nulos (`[null]`) de forma correta para os membros que participaram de batalhas mas não cometeram assassinatos diretos.
