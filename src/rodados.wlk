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

class Dependencia {
	var flota = []
	var property empleados
	var pedidos = []
	
	method agregarPedido(pedido) {
		pedidos.add(pedido)
	}
	method quitarPedido(unObjeto) {
		pedidos.remove(unObjeto)
	}
	
	method agregarAFlota(rodado) {
		flota.add(rodado)
	}
	method pesoTotalFlota() {
		return flota.sum{ rodado => rodado.peso() }
	}
	method bienEquipadaRodados() {
		return flota.size()>=3
	}
	method bienEquipadaVelocidad() {
		return flota.all{ rodado => rodado.velocidad()>=100 }
	}
	method estaBienEquipada(){
		return self.bienEquipadaRodados() and self.bienEquipadaVelocidad()
	}
	method filtrarColor(color) {
		return flota.filter{ rodado => rodado.color()==color }
	}
	method capacidadTotalEnColor(color) {
		return self.filtrarColor(color).sum{ rodado => rodado.capacidad() }
	}
	method colorDelRodadoMasRapido() {
		return flota.max{ rodado => rodado.velocidad() }.color()
	}
	method capacidadTotal() {
		return flota.sum{ rodado => rodado.capacidad()}
	}
	method capacidadFaltante() {
		return 0.max(empleados - self.capacidadTotal())
	}
	method esGrande() {
		return empleados>=40 and flota.size()>=5
	}
	method totalPasajerosPedidos() {
		return pedidos.sum{ pedido => pedido.pasajeros() }
	}
	method pedidosNoSatisfechos() {
		return  pedidos.filter{ pedido => not self.puedeSatisfacerAlgunPedido(pedido) }
	}
	method puedeSatisfacerAlgunPedido(pedido) {
		return flota.any{ rodado => pedido.puedeSerSatisfecho(rodado)}
	}
	method todosColorIncompatible(color) {
		return 0
	}
}

class Pedido {
	var property distancia
	var property tiempo
	var property pasajeros
	var coloresInc = []
	
	method velocRequerida() {
		return distancia/tiempo
	}
	method puedeSerSatisfecho(rodado) {
		return rodado.velocidadMax() - self.velocRequerida() >= 10 and rodado.capacidad()>= self.pasajeros() and not coloresInc.any{ color => color==rodado.color()}
	}
	method acelerar() {
		tiempo-=1
	}
	method relajar() {
		tiempo+=1
	}
}












