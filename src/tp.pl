
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

% Profesion
profesion(bakunin,aviacion_militar).
profesion(ravachol,inteligencia_militar).
profesion(rosaDubovsky,recolector_de_basura).
profesion(rosaDubovsky,asesina).
profesion(emmaGoldman,profesora_de_judo).
profesion(emmaGoldman,cineasta).
profesion(judithButler,profesora_de_judo).
profesion(judithButler,inteligencia_militar).
profesion(elisaBachofen,ingeniera_mecanica). %trabajan en un lugar

% Habilidades

esBuenoEn(bakunin,conductor).
esBuenoEn(ravachol,tiro_al_blanco).
esBuenoEn(rosaDubovsky,constructor_de_puentes).
esBuenoEn(rosaDubovsky,mirar_Peppa_Pig).
esBuenoEn(emmaGoldman,Habilidad):-
    esBuenoEn(judithButler,Habilidad).

esBuenoEn(emmaGoldman,Habilidad):-
    esBuenoEn(elisaBachofen,Habilidad).

esBuenoEn(judithButler,judo).
esBuenoEn(elisaBachofen,armar_bombas).

%Hobbies

leGusta(ravachol,juegos_de_azar). 
leGusta(ravachol,ajedrez). 
leGusta(ravachol,tiro_al_blanco). 
leGusta(rosaDubovsky,construir_puentes).
leGusta(rosaDubovsky,mirar_Peppa_Pig).
leGusta(rosaDubovsky,fisica_cuantica).

leGusta(emmaGoldman,Gustos):-
    leGusta(judithButler,Gustos).

leGusta(judithButler,judo).
leGusta(judithButler,automovilismo).
leGusta(juanSuriano,judo). %es experto en judo
leGusta(juanSuriano,armar_bombas). %es experto
leGusta(juanSuriano,ring_range). %es experto
leGusta(elisaBachofen,fuego).
leGusta(elisaBachofen,destruccion).


%HistorialCriminal

historialCriminal(bakunin,robo_aeronaves).
historialCriminal(bakunin,fraude).
historialCriminal(bakunin,tenencia_cafeina).
historialCriminal(judithButler,falsificacion_cheques).
historialCriminal(judithButler,fraude).


% Punto 2: Viviendas
% vivienda("Nombre","Caracteristicas","Ocupantes").

% vivienda(casa_de_papel,pasadizo_1).
% vivienda(casa_de_papel,pasadizo_2).
% vivienda(casa_de_papel,cuartoSecreto_1,(medida(5,3))).
% vivienda(casa_de_papel,cuartoSecreto_2,(medida(4,7))).
% vivienda(casa_de_papel,tunelSecreto_1,(longitud(9,estado(terminado)))).
% vivienda(casa_de_papel,tunelSecreto_2,(longitud(2,estado(terminado)))).



% Punto 5: Rebelde
% Una persona se considera posible disidente si cumple todos estos requisitos

% 1.    Tener una habilidad en algo considerado terrorista. Se considera terrorista armar
% bombas, tirar al blanco o mirar Peppa Pig.

esDisidente(UnaPersona):-
    esPotencialTerrorista(UnaPersona),
    esAntipatico(UnaPersona). %no tiene gustos registrados o le gusta todo en lo que es bueno.
    % esPotencialCriminal(UnaPersona). %falta construir.


esPotencialTerrorista(UnaPersona):-
    esBuenoEn(UnaPersona,bombas).

esPotencialTerrorista(UnaPersona):-
    esBuenoEn(UnaPersona,tiro_al_blanco).

esPotencialTerrorista(UnaPersona):-
    esBuenoEn(UnaPersona,mirar_Peppa_Pig).

esAntipatico(UnaPersona):-
    noTieneGustosRegistrados(UnaPersona).

esAntipatico(UnaPersona):-
    leGustaTodoEnLoQueEsBueno(UnaPersona).

noTieneGustosRegistrados(UnaPersona):-
    persona(UnaPersona),
    not(leGusta(UnaPersona,_)).

leGustaTodoEnLoQueEsBueno(UnaPersona):-
    persona(UnaPersona),
    % hobbies(UnaPersona,Actividades),
    forall(leGusta(_,Actividades), esBuenoEn(UnaPersona,Actividades)).
    

% 2.    No tener gustos registrados en el sistema o que le guste todo en lo que es bueno.



:- begin_tests(tp).

test(las_habilidades_de_emma_goldman,nondet):-
    esBuenoEn(emmaGoldman,armar_bombas),
    esBuenoEn(emmaGoldman,judo).

test(los_gustos_de_emma_goldman,nondet):-
    leGusta(emmaGoldman,automovilismo),
    leGusta(emmaGoldman,judo).

:- end_tests(tp).
