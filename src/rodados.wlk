class Corsa {
	var property color
	method capacidad() = return 4
	method velocidadMax() = 150
	method peso() = return 1300
}

class Kwid {
	var property tieneTanqueAdicional=false
	method color() { return "Azul" }
	method capacidad() { return if (tieneTanqueAdicional) { 3 } else { 4 } }
	method velocidadMax() { return if (tieneTanqueAdicional) { 120 } else { 110 } }
	method peso() { return if (tieneTanqueAdicional) { 1200 + 150 } else { 1200 } }
}

class AutoEspecial {
	var property color
	var property capacidad
	var property velocidadMax
	var property peso
}

object traffic {
	var property interior
	var property motor
	
	method capacidad() = interior.capacidad()
	method velocidadMax() = motor.velocidadMax()
	method peso() { return interior.peso() + motor.peso() + 4000}
	method color() { return "blanco" }
}

object interioComodo {
	method capacidad() = 5
	method peso() = 700
}

object interioPopular {
	method capacidad() = 12
	method peso() = 1000
}

object motorPulenta {
	method peso() { return 800 }
	method velocidadMax() { return 130 }
}

object motorBataton {
	method peso() { return 500 }
	method velocidadMax() { return 80 }
}












