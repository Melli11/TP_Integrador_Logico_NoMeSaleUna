
% Punto 1

% Predicados justificacion

% El predicado persona lo utilizo para modelar la existencia de las personas del planeta. 
% El predicado profesion representa aquello en lo que trabaja o desea trabajar
% El predicado habilidades representan en qué son buenos.
% El predicado hobbies son aquellas actividades que le gustan a la persona.

persona(bakunin).
persona(ravachol).
persona(rosaDubovsky).
persona(emmaGoldman).
persona(judithButler).
persona(elisaBachofen).
persona(juanSuriano).
persona(sebastienFaure).

profesion(persona(bakunin),aviacion_militar).
habilidades(bakunin,conductor).
historialCriminal(bakunin, robo_aeronaves).
historialCriminal(bakunin, fraude,tenencia_cafeina).
historialCriminal(bakunin, tenencia_cafeina).

profesion(ravachol,inteligencia_militar).
habilidades(ravachol,tiro_al_blanco).
hobbies(ravachol,juegos_de_azar). 
hobbies(ravachol,ajedrez). 
hobbies(ravachol,tiro_al_blanco). 

profesion(rosaDubovsky,recolector_de_basura).
profesion(rosaDubovsky,asesina).
habilidades(rosaDubovsky,constructor_de_puentes).
habilidades(rosaDubovsky,mirar_Peppa_Pig).
hobbies(rosaDubovsky,construir_puentes).
hobbies(rosaDubovsky,mirar_Peppa_Pig).
hobbies(rosaDubovsky,fisica_cuantica).


profesion(emmaGoldman,profesora_de_judo).
profesion(emmaGoldman,cineasta).

% habilidades(emmaGoldman,Habilidad):-
%     habilidades(judithButler,Habilidad_J),
%     habilidades(elisaBachofen,Habilidad_E).

profesion(judithButler,profesora_de_judo).
profesion(judithButler,inteligencia_militar).
habilidades(judithButler,judo).
hobbies(judithButler,judo).
hobbies(judithButler,automovilismo).
historialCriminal(judithButler,falsificacion_cheques).
historialCriminal(judithButler,fraude).

profesion(elisaBachofen,ingeniera_mecanica). %trabajan en un lugar
habilidades(elisaBachofen,armar_bombas).
hobbies(elisaBachofen,fuego).
hobbies(elisaBachofen,destruccion).

hobbies(juanSuriano,judo). %es experto en judo
hobbies(juanSuriano,armar_bombas). %es experto
hobbies(juanSuriano,ring_range). %es experto

:- begin_tests(tp).

test(las_habilidades_de_emma_goldman):-
    habilidades(emmaGoldman,armar_bombas),
    habilidades(emmaGoldman,judo).

test(los_gustos_de_emma_goldman):-
    hobbies(emmaGoldman,automovilismo),
    hobbies(emmaGoldman,judo).

:-end_test(tp).
