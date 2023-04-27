create table type (type_id integer primary key, type1 text, type2 text);
insert into type (type1, type2) select distinct type1, type2 from imported_pokemon_data_second_normal_form;
create table pokemon_type (pokedex_number text, type_id int, foreign key (pokedex_number) references imported_pokemon_data_second_normal_form(pokedex_number), foreign key (type_id) references type(type_id));
insert into pokemon_type (pokedex_number, type_id) select imported_pokemon_data_second_normal_form.pokedex_number, type.type_id from imported_pokemon_data_second_normal_form join type on imported_pokemon_data_second_normal_form.type1=type.type1 and imported_pokemon_data_second_normal_form.type2=type.type2;
sqlite> select * from pokemon_type;
create table pokemon_against (type_id int foreign_key references type(type_id), against_bug text, against_dark text, against_dragon text, against_electric text, against_fairy text, against_fight text, against_fire text, against_flying text, against_ghost text, against_grass text, against_ground text, against_ice text, against_normal text, against_poison text, against_psychic text, against_rock text, against_steel text, against_water text);
insert into pokemon_against (type_id, against_bug, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic, against_rock, against_steel, against_water) select pokemon_type.type_id, imported_pokemon_data_second_normal_form.against_bug, imported_pokemon_data_second_normal_form.against_dark, imported_pokemon_data_second_normal_form.against_dragon, imported_pokemon_data_second_normal_form.against_electric, imported_pokemon_data_second_normal_form.against_fairy, imported_pokemon_data_second_normal_form.against_fight, imported_pokemon_data_second_normal_form.against_fire, imported_pokemon_data_second_normal_form.against_flying, imported_pokemon_data_second_normal_form.against_ghost, imported_pokemon_data_second_normal_form.against_grass, imported_pokemon_data_second_normal_form.against_ground, imported_pokemon_data_second_normal_form.against_ice, imported_pokemon_data_second_normal_form.against_normal, imported_pokemon_data_second_normal_form.against_poison, imported_pokemon_data_second_normal_form.against_psychic, imported_pokemon_data_second_normal_form.against_rock, imported_pokemon_data_second_normal_form.against_steel, imported_pokemon_data_second_normal_form.against_water from imported_pokemon_data_second_normal_form join pokemon_type on imported_pokemon_data_second_normal_form.pokedex_number=pokemon_type.pokedex_number;
create table pokemon_against2 as select distinct * from pokemon_against;
drop table pokemon_against;
alter table imported_pokemon_data_second_normal_form drop column type1;
alter table imported_pokemon_data_second_normal_form drop column type2;
alter table imported_pokemon_data_second_normal_form drop column against_bug;
alter table imported_pokemon_data_second_normal_form drop column against_dark;
alter table imported_pokemon_data_second_normal_form drop column against_dragon;
alter table imported_pokemon_data_second_normal_form drop column against_electric;
alter table imported_pokemon_data_second_normal_form drop column against_fairy;
alter table imported_pokemon_data_second_normal_form drop column against_fight;
alter table imported_pokemon_data_second_normal_form drop column against_fire;
alter table imported_pokemon_data_second_normal_form drop column against_flying;
alter table imported_pokemon_data_second_normal_form drop column against_ghost;
alter table imported_pokemon_data_second_normal_form drop column against_grass;
alter table imported_pokemon_data_second_normal_form drop column against_ground;
alter table imported_pokemon_data_second_normal_form drop column against_ice;
alter table imported_pokemon_data_second_normal_form drop column against_normal;
alter table imported_pokemon_data_second_normal_form drop column against_poison;
alter table imported_pokemon_data_second_normal_form drop column against_psychic;
alter table imported_pokemon_data_second_normal_form drop column against_rock;
alter table imported_pokemon_data_second_normal_form drop column against_steel;
alter table imported_pokemon_data_second_normal_form drop column against_water;