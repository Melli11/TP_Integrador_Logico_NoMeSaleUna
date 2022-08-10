
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
esBuenoEn(rosaDubovsky,construir_puentes).
esBuenoEn(rosaDubovsky,mirar_Peppa_Pig).
esBuenoEn(emmaGoldman,Habilidad):-
    esBuenoEn(judithButler,Habilidad).

esBuenoEn(emmaGoldman,Habilidad):-
    esBuenoEn(elisaBachofen,Habilidad).

esBuenoEn(judithButler,judo).
esBuenoEn(elisaBachofen,armar_bombas).
esBuenoEn(juanSuriano,Habilidad):-
    leGusta(juanSuriano,Habilidad).
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

%vivienda: Representa el conjunto de las viviendas
vivienda(la_severino).
vivienda(comisaria_48).
vivienda(casa_de_papel).
vivienda(casa_de_sol_naciente).


% viveEn("NombreDeLaVivienda","Ocupantes"): viveEn relaciona las viviendas con sus ocupantes
viveEn(la_severino,bakunin).
viveEn(la_severino,elisaBachofen).
viveEn(la_severino,rosaDubovsky).
viveEn(comisaria_48,ravachol).
viveEn(casa_de_papel,emmaGoldman).
viveEn(casa_de_papel,juanSuriano).
viveEn(casa_de_papel,judithButler).


% pasadizo("NombreDeVivienda","Cantidad")
pasadizo(la_severino,1).
pasadizo(casa_de_papel,2).
pasadizo(casa_de_sol_naciente,1).

% cuartoSecreto("NombreDeVivienda",Largo,Ancho)
cuartoSecreto(la_severino,4,8).
cuartoSecreto(casa_de_papel,5,3).
cuartoSecreto(casa_de_papel,4,7).


% tunelSecreto("NombreDeVivienda",Longitud,EstadoDeConstruccion).
tunelSecreto(la_severino,8,finalizado).
tunelSecreto(la_severino,5,finalizado).
tunelSecreto(la_severino,1,en_construccion).
tunelSecreto(casa_de_papel,9,finalizado).
tunelSecreto(casa_de_papel,2,finalizado).
tunelSecreto(casa_de_sol_naciente,3,sin_construir).


%Punto 3: 


% Punto 5: Rebelde
% Una persona se considera posible disidente si cumple todos estos requisitos

% 1.    Tener una habilidad en algo considerado terrorista. Se considera terrorista armar
% bombas, tirar al blanco o mirar Peppa Pig.

esDisidente(UnaPersona):-
    esPotencialTerrorista(UnaPersona), % poseen habilidades consideradas como terroristas
    esAntipatico(UnaPersona), %no tiene gustos registrados o le gusta todo en lo que es bueno.
    esPotencialCriminal(UnaPersona). %tienen más de un registro en su historial criminal o viven junto con alguien que sí lo tiene

esPotencialTerrorista(UnaPersona):-
    esBuenoEn(UnaPersona,armar_bombas).

esPotencialTerrorista(UnaPersona):-
    esBuenoEn(UnaPersona,tiro_al_blanco).

esPotencialTerrorista(UnaPersona):-
    esBuenoEn(UnaPersona,mirar_Peppa_Pig).
 

% 2. No tener gustos registrados en el sistema o que le guste todo en lo que es bueno.

esAntipatico(UnaPersona):-
    noTieneGustosRegistrados(UnaPersona).

esAntipatico(UnaPersona):-
    leGustaTodoEnLoQueEsBueno(UnaPersona).

noTieneGustosRegistrados(UnaPersona):-
    persona(UnaPersona),
    not(leGusta(UnaPersona,_)).

leGustaTodoEnLoQueEsBueno(UnaPersona):-
    persona(UnaPersona),
    forall(esBuenoEn(UnaPersona,Actividades),leGusta(UnaPersona,Actividades)).

% Tener más de un registro en su historial criminal o vivir junto con alguien que sí lo tenga3

esPotencialCriminal(UnaPersona):-
    tieneAntecedentes(UnaPersona).

esPotencialCriminal(UnaPersona):-
    viveConUnCriminal(UnaPersona).


tieneAntecedentes(UnaPersona):-
    historialCriminal(UnaPersona,_).

viveConUnCriminal(UnaPersona):-
    viveEn(Casa,UnaPersona),
    viveEn(Casa,OtraPersona),
    UnaPersona \= OtraPersona.

:- begin_tests(tp).

test(las_habilidades_de_emma_goldman,nondet):-
    esBuenoEn(emmaGoldman,armar_bombas),
    esBuenoEn(emmaGoldman,judo).

test(los_gustos_de_emma_goldman,nondet):-
    leGusta(emmaGoldman,automovilismo),
    leGusta(emmaGoldman,judo).

test(son_potenciales_terroristas,nondet):-
    esPotencialTerrorista(elisaBachofen),
    esPotencialTerrorista(juanSuriano),
    esPotencialTerrorista(emmaGoldman),
    esPotencialTerrorista(ravachol),
    esPotencialTerrorista(rosaDubovsky).
    
test(los_insipidos,nondet):-
    esAntipatico(bakunin),
    esAntipatico(juanSuriano),
    esAntipatico(judithButler),
    esAntipatico(ravachol),
    esAntipatico(rosaDubovsky),
    esAntipatico(sebastienFaure).

:- end_tests(tp).
