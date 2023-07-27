//juego del AHORCADO
Funcion palabraAdivinar(palabra por referencia, acierto por referencia) //usuario ingresa palabra a adivinar
	definir i Como Entero; 
	Escribir "";
	Escribir "Jugador 1";
	Escribir "Introduzca la palabra a adivinar";
	leer palabra;
	para i<-0 Hasta Longitud(palabra) Hacer//guardamos caracteres como aciertos recorriendo segun la longitud de la palabra
		acierto[i]<-falso;
	FinPara
	Borrar Pantalla;
FinFuncion

Funcion cantAciertos <- numeroDeAciertos(aciertos, palabra Por Referencia) //funcion que corrobora que letras se acertaron
	Definir cantAciertos, i Como Entero;
	cantAciertos<-0;
	para i<-0 Hasta Longitud(palabra) Hacer
		si aciertos[i] Entonces
			cantAciertos<- cantAciertos+1;
		FinSi
	FinPara
FinFuncion

Funcion escribirPalabra(palabra, aciertos)// si la letra ingresada es acertada se escribe sino pone _ en el lugar de la letra
	definir i Como Entero;
	escribir "";
	Escribir "Jugador 2";
	Escribir "Palabra a adivinar:";
	para i<-0 Hasta Longitud(palabra)-1 Hacer
		si aciertos[i] Entonces
			escribir Sin Saltar Subcadena(palabra, i,i);
		SiNo
			Escribir Sin Saltar " _ ";
		FinSi
	FinPara
	Escribir "";
FinFuncion

Funcion acierto <- comprobarPalabra(letra, palabra, aciertos Por Referencia) //comprueba los aciertos
	definir i Como Entero;
	definir acierto Como Logico;
	acierto<-falso;
	para i<-0 hasta longitud(palabra)-1 Hacer
		si Subcadena(palabra, i, i)= letra Entonces
			aciertos[i]<-Verdadero;
			acierto<-Verdadero;
		FinSi
	FinPara
	escribir"";
FinFuncion

funcion leerLetra(letra Por Referencia, letras Por Referencia) // Ingresa la letra y muestra las ingresadas al usuario
	escribir Sin Saltar "Introduzca una letra a adivinar: ";
	leer letra;
	letras<-Concatenar(letras,Concatenar(letra," / "));
FinFuncion

Funcion dibujoAhorcado(cantFallos)// Dibujamos el ahorcado segun la cantidad de fallos (8 intentos)
	Escribir "";
	Escribir "···A·H·O·R·C·A·D·O···";
	Escribir "";
	Segun cantFallos Hacer
		0:
			Escribir "";
			Escribir "";
			Escribir "";
			Escribir "";
			Escribir "";
			Escribir "";
		1:
			Escribir "------";
			Escribir "";
			Escribir "";
			Escribir "";
			Escribir "";
			Escribir "_________";
		2:
			Escribir "------";
			Escribir "|   |";
			Escribir "|";
			Escribir "|";
			Escribir "|";
			Escribir "_________";
		3:
			Escribir "------";
			Escribir "|    |";
			Escribir "|   O";
			Escribir "|";
			Escribir "|";
			Escribir "_________";
		4:
			Escribir "------";
			Escribir "|    |";
			Escribir "|   O";
			Escribir "|   /";
			Escribir "|    ";
			Escribir "_________";
		5:
			Escribir "------";
			Escribir "|    |";
			Escribir "|   O";
			Escribir "|   /|";
			Escribir "|    ";
			Escribir "_________";
		6:
			Escribir "------";
			Escribir "|    |";
			Escribir "|   O";
			Escribir "|   /|\";
			Escribir "|    ";
			Escribir "_________";
		7:
			Escribir "------";
			Escribir "|    |";
			Escribir "|   O";
			Escribir "|   /|\";
			Escribir "|   / ";
			Escribir "_________";
		8:
			Escribir "------";
			Escribir "|    |";
			Escribir "|   O";
			Escribir "|   /|\";
			Escribir "|   / \";
			Escribir "_________";
	FinSegun
	Escribir "";
FinFuncion


Proceso AHORCADO //funcion main donde ejecutamos todas las funciones
	definir palabra, letras, letra Como cadena;
	definir aciertos Como Logico;
	definir cantFallos Como Entero;
	dimension aciertos[50]; //definimos 50 aciertos como exagerado, para que sobre
	letras<-""; //iniciamos las letras vacias
	cantFallos<-0;//tambien la cantidad de fallos
	//Ejecutamos funciones:
	palabraAdivinar(palabra,aciertos);//primero pide al usuario la palabra q se divinara
	Repetir
		Borrar Pantalla;//borra la pantalla y muestra lo siguiente:
		escribirPalabra(palabra,aciertos);//escribe la palabra con "_" de las letras no acertadas al principio
		dibujoAhorcado(cantFallos);//muestra el dibujo segun la cantidad de fallos
		escribir "·Letras introducidas: ", letras; //muestra listado de letras ya ingresadas y q son incorrectas
		leerLetra(letra, letras); //corrobora las letras leidas
		si comprobarPalabra(letra, palabra, aciertos) entonces //conteo de fallos
			cantFallos<-cantFallos; 
		SiNo
			cantFallos<-cantFallos+1; 
		FinSi
		
	Hasta Que numeroDeAciertos(aciertos, palabra) = Longitud(palabra) o cantFallos = 8; 
	//se termina el ciclo si la cant de aciertos es igual a long de palabra o los fallos =8 intentos (dibujo)
	Borrar Pantalla;
	si cantFallos=8 Entonces
		escribirPalabra(palabra,aciertos);
		dibujoAhorcado(cantFallos);
		Escribir " PERDISTE :(";
	SiNo
		Escribir " GANASTE :D";
		
	FinSi

FinProceso
