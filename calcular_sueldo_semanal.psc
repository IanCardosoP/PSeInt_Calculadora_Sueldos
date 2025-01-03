// PSeInt_Calculadora_Sueldos
// Un ejercicio breve de pseudocódigo para ir haciendo lógica por ratos.
	
	
	// TO-DO
	// - Crear funcion independiente booleana para feriado trabajado en los ultimos 7 días
	// - crear función para ingresar los días trabajados no mayor a 6 días y ajustar el pago semanal.
	// - crear función booleana de domingo trabajado para prima dominical y ajustar el pago semala.
	// - crear función para añadir deducciones adicionales y restarlas del pago neto.


// Encontrar y retornar el tabulador de sueldo en el Tabulador matriz_isr
Funcion t <- encontrar_tabulador(salario, matriz_isr Por Referencia)
	para i <- 0 hasta 10
		si (salario >= matriz_isr[i,0]) Y (salario <= matriz_isr[i,1])
			t <- i // Retorna Valor entero del indice en el tabulador
		FinSi
	FinPara
FinFuncion

// Calcular y retornar ISR con variables asignadas segun el rango en el tabulador
Funcion isr <- calcular_ISR(salario, matriz_isr Por Referencia)	
	Definir i Como Entero // Indice en el tabulador
    Definir limite_inferior, cuota_fija, tasa_excedente, s Como Real
    
	// Asignar Variables	
	s <- salario
	i <- encontrar_tabulador(salario, matriz_isr)
	
	limite_inferior <- matriz_isr[i,0]				
	limite_superior <- matriz_isr[i,1]				
	cuota_fija <- matriz_isr[i,2]				
	tasa_excedente <- matriz_isr[i,3]		
	
	// Calcular el ISR	
	isr <- ((salario - limite_inferior) * tasa_excedente) + cuota_fija	
FinFuncion

// Calcular el pago semanal producto del salario diario y días feriados trabajados.
Funcion PagoSemanal <- calcular_pago_semanal(salario)
	Definir feriado Como Caracter
	Definir f Como Logico
	feriado = ''
	f <- Verdadero
	
	Mientras f = Verdadero Y ((Mayusculas(feriado) <> 'SI') o (Mayusculas(feriado) <> 'NO')) Hacer
		Escribir 'Se trabajó un día feriado en los ultimos 7 días? (Si/No)'
		Leer feriado
		
		Si Mayusculas(feriado) = 'NO'
			PagoSemanal <- salario * 7
			f <- Falso
		FinSi
		
		Si Mayusculas(feriado) = 'SI'
			PagoSemanal <- salario * 7 + (salario * 2)
			f <- Falso
		FinSi
	FinMientras
FinFuncion

// Generar Impresión de Nómina formateada
Funcion generar_nomina(salario_diario por Valor, pago_semanal por Valor, isr por Valor)
	
	Escribir '***************************************'
	Escribir '**********Operadora Salarios***********'
	Escribir '* Sueldo día: $', salario_diario, 'mxn.'
	Si (pago_semanal / 7) = salario_diario Entonces
		Escribir '* Día feriado trabajado: NO'	
	SiNo
		Escribir '* Día feriado trabajado: SI'
	FinSi
	Escribir '* Deducción ISR: $', isr, 'mxn.'
	Escribir '* Otras deducciones: N/A'
	Escribir '**** Total neto a recibir: $', pago_semanal, 'mxn.'
FinFuncion

Algoritmo calcular_sueldo_semanal // Main 
	
	// Definición de Variables
	Definir salario_diario, pago_semanal, matriz_isr Como Real
	
	// Definición de la matriz del ISR como una variable global constante
	Dimension matriz_isr[11,4]	// [limite_inferior[0], limite_superior[1], cuota_fija[2], tasa_excedente[3]]	
	
	// limite_inferior	
	matriz_isr[0,0] <- 0.01	
	matriz_isr[1,0] <- 171.79	
	matriz_isr[2,0] <- 1458.04	
	matriz_isr[3,0] <- 2562.36	
	matriz_isr[4,0] <- 2978.65	
	matriz_isr[5,0] <- 3566.23	
	matriz_isr[6,0] <- 7192.65	
	matriz_isr[7,0] <- 11336.58	
	matriz_isr[8,0] <- 21643.31	
	matriz_isr[9,0] <- 28857.79	
	matriz_isr[10,0] <- 86573.35
	
	// limite_superior	
	matriz_isr[0,1] <- 171.78	
	matriz_isr[1,1] <- 1458.03	
	matriz_isr[2,1] <- 2562.35	
	matriz_isr[3,1] <- 2978.64	
	matriz_isr[4,1] <- 3566.22	
	matriz_isr[5,1] <- 7192.64	
	matriz_isr[6,1] <- 11336.57	
	matriz_isr[7,1] <- 21643.30	
	matriz_isr[8,1] <- 28857.78	
	matriz_isr[9,1] <- 86573.34	
	matriz_isr[10,1] <- 999999
	
	// Cuota fija	
	matriz_isr[0,2] <- 0.00	
	matriz_isr[1,2] <- 3.29	
	matriz_isr[2,2] <- 85.61	
	matriz_isr[3,2] <- 205.80	
	matriz_isr[4,2] <- 272.37	
	matriz_isr[5,2] <- 377.65	
	matriz_isr[6,2] <- 1152.27	
	matriz_isr[7,2] <- 2126.95	
	matriz_isr[8,2] <- 5218.92	
	matriz_isr[9,2] <- 7527.59	
	matriz_isr[10,2] <- 27150.83	
	
	// tasa_excedente	
	matriz_isr[0,3] <- 0.0192	
	matriz_isr[1,3] <- 0.064	
	matriz_isr[2,3] <- 0.1088	
	matriz_isr[3,3] <- 0.16	
	matriz_isr[4,3] <- 0.1792	
	matriz_isr[5,3] <- 0.2136	
	matriz_isr[6,3] <- 0.2352	
	matriz_isr[7,3] <- 0.3	
	matriz_isr[8,3] <- 0.32	
	matriz_isr[9,3] <- 0.34	
	matriz_isr[10,3] <- 0.35
	
	
	// Caso de Uso
	Escribir 'Ingrese sueldo diario del colaborador.'
	Leer salario_diario
	
	salario_diario <- salario_diario
	pago_semanal <- calcular_pago_semanal(salario_diario)
	isr <- calcular_ISR(pago_semanal, matriz_isr)
	
	generar_nomina(salario_diario, pago_semanal, isr)
	
FinAlgoritmo




