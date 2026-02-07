## **English version**

# Universe Database

Relational database modeling celestial bodies using PostgreSQL, with a clear separation between database schema and data loading.

This project contains:

* A SQL dump with the complete **database schema only** (tables, columns, constraints, and relationships)
* CSV files containing the data
* A Bash script responsible for importing the CSV data into the database

---

## Database Schema

The database is structured to represent a hierarchical model of celestial bodies.

### Tables

* `galaxy`
* `star`
* `planet`
* `moon`
* `planet_atmospheres`

---

## Relationships

* `galaxy` 1:N `star`
* `star` 1:N `planet`
* `planet` 1:N `moon`
* `planet_atmospheres` is an independent table (no foreign keys)

---

## Data Source

The data is provided through CSV files, including:

* Galaxies
* Stars
* Planets
* Moons
* Planetary atmospheres

The CSV files are loaded into the database using a Bash script.

---

## Technologies

* PostgreSQL
* SQL (DDL)
* Bash scripting
* CSV data files

---

## How to Run

1. Create the database manually (if it does not exist):

   ```bash
   createdb universo_db
   ```

2. Restore the database schema (tables, constraints, relationships):

   ```bash
   psql -U postgres -d universo_db -f universe_schema.sql
   ```

3. Run the Bash script to import the CSV data:

   ```bash
   ./inserir_corpos_celestes.sh
   ```

---

## Notes

* The schema dump does not include any data rows.
* All data insertion is handled by the Bash script.
* The order of insertion respects foreign key dependencies.

---

---

## **Versão em Português**

# Universe Database

Banco de dados relacional que modela corpos celestes utilizando PostgreSQL, com separação clara entre estrutura do banco e carga de dados.

Este projeto contém:

* Um dump SQL contendo apenas o **schema do banco de dados** (tabelas, colunas, constraints e relacionamentos)
* Arquivos CSV com os dados
* Um script em Bash responsável por inserir os dados dos CSVs no banco de dados

---

## Estrutura do Banco de Dados

O banco foi modelado para representar uma hierarquia de corpos celestes.

### Tabelas

* `galaxy`
* `star`
* `planet`
* `moon`
* `planet_atmospheres`

---

## Relacionamentos

* `galaxy` 1:N `star`
* `star` 1:N `planet`
* `planet` 1:N `moon`
* `planet_atmospheres` é uma tabela independente (não possui chaves estrangeiras)

---

## Fonte dos Dados

Os dados são fornecidos por meio de arquivos CSV, incluindo:

* Galáxias
* Estrelas
* Planetas
* Luas
* Atmosferas planetárias

Os arquivos CSV são importados para o banco por meio de um script em Bash.

---

## Tecnologias

* PostgreSQL
* SQL (DDL)
* Bash scripting
* Arquivos CSV

---

## Como Executar

1. Crie o banco de dados manualmente (caso ainda não exista):

   ```bash
   createdb universo_db
   ```

2. Restaure o schema do banco de dados (tabelas, constraints e relacionamentos):

   ```bash
   psql -U postgres -d universo_db -f universe_schema.sql
   ```

3. Execute o script Bash para importar os dados dos CSVs:

   ```bash
   ./inserir_corpos_celestes.sh
   ```

---

## Observações

* O dump do schema não contém dados.
* Toda a inserção de dados é feita via script Bash.
* A ordem de inserção respeita as dependências de chaves estrangeiras.

---
