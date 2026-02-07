#!/bin/bash

# Script para inserir dados nas tabelas "galaxy", "moon", "planet", "planet_atmospheres" e "star" usando CSV's

# Primeiro, definir a variável que permite executar comandos SQL:
export PGPASSWORD='123'
PSQL="psql -X --username=postgres --dbname=universo_db --no-align --tuples-only -c"

# Sempre que rodar o script, zerar e inserir todos os dados novamente:
echo $($PSQL "TRUNCATE galaxy, moon, planet, planet_atmospheres, star")

# Nessa parte vai pegar o csv das galáxias e passar os valores para as variáveis, cada uma representando uma coluna. Valores separdos por vírgula.
cat galaxias.csv | while IFS="," read GALAXY_ID NAME DIAMETER_IN_LY DISTANCE_IN_LY TYPE
do
# Em todos os csv's, a primeira linha não são valores, para evitá-las:
if [[ $GALAXY_ID != "galaxy_id" && $NAME != 'name' && $DIAMETER_IN_LY != 'diameter_in_ly' && $DISTANCE_IN_LY != 'distance_in_ly' && $TYPE != 'type' ]]
then
# Inserir dados na tabela galaxy
INSERIR_TABELA_GALAXIAS=$($PSQL "INSERT INTO galaxy(galaxy_id, name, diameter_in_ly, distance_in_ly, type) VALUES ('$GALAXY_ID', '$NAME', '$DIAMETER_IN_LY', '$DISTANCE_IN_LY', '$TYPE')")
if [[ "$INSERIR_TABELA_GALAXIAS" == *"INSERT"* ]]
then
echo -e "\nNovas inserções na tabela: galaxy \n$NAME\n$DIAMETER_IN_LY\n$DISTANCE_IN_LY\n$TYPE\n"
fi
fi
done

# Inserir dados na tabela star
cat estrelas.csv | while IFS="," read STAR_ID STAR_NAME GALAXY_ID TYPE NOTES
do
if [[ $STAR_ID != "star_id" && $STAR_NAME != 'name' && $GALAXY_ID != 'galaxy_id' && $TYPE != 'type' && $NOTES != 'notes' ]]
then
INSERIR_TABELA_ESTRELAS=$($PSQL "INSERT INTO star(star_id,name,galaxy_id,type,notes) VALUES ('$STAR_ID', '$STAR_NAME', '$GALAXY_ID', '$TYPE', '$NOTES')")
if [[ "$INSERIR_TABELA_ESTRELAS" == *"INSERT"* ]]
then
echo -e "\nNovas inserções na tabela: star \n$STAR_NAME\n$TYPE\n$NOTES\n"
fi
fi
done

#Inserir dados na tabela planet
cat planetas.csv | while IFS="," read PLANET_ID PLANET_NAME STAR_ID PLANET_TYPE ORBITAL_PERIOD_DAYS HAS_ATMOSPHERE
do
if [[ $PLANET_ID != "planet_id" && $PLANET_NAME != "name" && $STAR_ID != "star_id" && $PLANET_TYPE != "planet_type" && $ORBITAL_PERIOD_DAYS != "orbital_period_days" && $HAS_ATMOSPHERE != "has_atmosphere" ]]
then
INSERIR_TABELA_PLANETA=$($PSQL "INSERT INTO planet (planet_id, name, star_id, planet_type, orbital_period_days, has_atmosphere) VALUES ('$PLANET_ID', '$PLANET_NAME', '$STAR_ID', '$PLANET_TYPE', '$ORBITAL_PERIOD_DAYS', '$HAS_ATMOSPHERE')")
if [[ $INSERIR_TABELA_PLANETA == *"INSERT"* ]]
then
echo -e "\nNovas inserções na tabela: planet \n$PLANET_NAME\n$PLANET_TYPE\n$ORBITAL_PERIOD_DAYS\n$HAS_ATMOSPHERE\n"
fi
fi
done

# Inserir dados na tabela planet_atmospheres
cat atmosferas_de_planetas.csv | while IFS="," read ATMOSPHERE_ID ATMOSPHERE_NAME ATMOSPHERE_TYPE ATMOSPHERIC_PRESSURE_PA
do
if [[ $ATMOSPHERE_ID != "planet_atmospheres" && $ATMOSPHERE_NAME != "name" && $ATMOSPHERE_TYPE != "atmosphere_type" && $ATMOSPHERIC_PRESSURE_PA != "atmospheric_pressure_pa" ]]
then
INSERIR_TABELA_ATMOSFERAS=$($PSQL "INSERT INTO planet_atmospheres(planet_atmospheres_id, name, atmosphere_type, atmospheric_pressure_pa) VALUES ('$ATMOSPHERE_ID', '$ATMOSPHERE_NAME', '$ATMOSPHERE_TYPE', '$ATMOSPHERIC_PRESSURE_PA')")
if [[ $INSERIR_TABELA_ATMOSFERAS == *"INSERT"* ]]
then
echo -e "\nNovas inserções na tabela: planet_atmospheres \n$ATMOSPHERE_NAME\n$ATMOSPHERE_TYPE\n$ATMOSPHERIC_PRESSURE_PA\n"
fi
fi
done

# Inserir dados na tabela moon
cat luas.csv | while IFS="," read MOON_ID MOON_NAME PLANET_ID ORBITAL_PERIOD_DAYS IS_GEOLOGICALLY_ACTIVE
do
if [[ $MOON_ID != "moon_id" && $MOON_NAME != "name" && $PLANET_ID != "planet_id" && $ORBITAL_PERIOD_DAYS != "orbital_period_days" && $IS_GEOLOGICALLY_ACTIVE != "is_geologically_active" ]]
then
INSERIR_TABELA_LUAS=$($PSQL "INSERT INTO moon(moon_id, name, planet_id, orbital_period_days, is_geologically_active) VALUES ('$MOON_ID', '$MOON_NAME', '$PLANET_ID', '$ORBITAL_PERIOD_DAYS', '$IS_GEOLOGICALLY_ACTIVE')")
if [[ $INSERIR_TABELA_LUAS == *"INSERT"* ]]
then
echo -e "\nNovas inserções na tabela: moon \n$MOON_NAME\n$ORBITAL_PERIOD_DAYS\n$IS_GEOLOGICALLY_ACTIVE\n"
fi
fi
done
