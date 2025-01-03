Algoritmo calculaIMC
	
	Definir altura Como Entero
	Definir peso, resultado Como Real
	
	Escribir ("Ingrese el Peso en KG")
	Leer peso
	
	Escribir ("Ingrese la altura en CM")
	Leer altura
		
	resultado = (peso / ((altura / 100)^2))
	
	Escribir "Su IMC es: " resultado
	
FinAlgoritmo
