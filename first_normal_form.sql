CREATE TABLE split_values AS SELECT abilities, trim(value) AS split_value FROM imported_pokemon_data, json_each('["' || replace(abilities, ',', '","') || '"]') WHERE split_value <> '';
create table imported_pokemon_data_updated as select split_values.split_value, imported_pokemon_data.* from imported_pokemon_data join split_values on imported_pokemon_data.abilities=split_values.abilities;
alter table imported_pokemon_data_updated as drop column abilities;
create table imported_pokemon_data_first_normal_form as select distinct * from imported_pokemon_data_updated;
alter table imported_pokemon_data_first_normal_form set split_value=trim(split_value, '[]');
drop table imported_pokemon_data;
drop table split_values;
drop table imported_pokemon_data_updated;
