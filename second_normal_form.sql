create table pokemon_abilities (pokedex_number text, ability text, foreign key (pokedex_number) references imported_pokemon_data_first_normal_form(pokedex_number));
insert into pokemon_abilities (pokedex_number, ability) select pokedex_number, split_value from imported_pokemon_data_first_normal_form;
alter table imported_pokemon_data_first_normal_form drop column split_value;
create table imported_pokemon_data_second_normal_form as select distinct * from imported_pokemon_data_first_normal_form;
drop table imported_pokemon_data_first_normal_form;
