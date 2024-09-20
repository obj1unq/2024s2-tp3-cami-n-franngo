/*objetos usados para testear los comportamientos del camión mientras aún no se habían modelado los otros objetos
Si se descomentan, se puede volver a probar el primer describe.
object paraTest1 {
	method peso() { return 201 }
	method nivelPeligrosidad() { return 5 }
}

object paraTest2 {
	method peso() { return 1200 }
	method nivelPeligrosidad() { return 15 }
}
*/

object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() { return 1 }

	method sufrirCambiosPostCarga() {}

}

object bumblebee {
	var property estado = robot

	method peso() { return 800 }
	method nivelPeligrosidad() { return estado.nivelPeligrosidad() }
	method bultos() { return 2 }

	method sufrirCambiosPostCarga() {
		estado = robot
	}

}

object robot {
	method nivelPeligrosidad() { return 30 }
}

object auto {
	method nivelPeligrosidad() { return 15 }
}

object paqueteDeLadrillos {
	const pesoLadrillo = 2
	var property cantidadDeLadrillos = 0

	method peso() { return pesoLadrillo * cantidadDeLadrillos }
	method nivelPeligrosidad() { return 2 }

	method bultos() {
		if (cantidadDeLadrillos>300) {
			return 3
		} else if (cantidadDeLadrillos>100) {
			return 2
		} else {
			return 1
		}
	}

	method agregarLadrillos(cantidad) {
		cantidadDeLadrillos += cantidad
	}

	method sufrirCambiosPostCarga() {
		self.agregarLadrillos(12)
	}

}

object arenaAGranel {
	var property peso = 0

	method nivelPeligrosidad() { return 1 }
	method bultos() { return 1 }

	method agregarKilos(kg) {
		peso += kg
	}

	method sufrirCambiosPostCarga() {
		self.agregarKilos(20)
	}

}

object bateriaAntiaerea {
	var property estado = sinMisiles

	method peso() { return estado.peso() }
	method nivelPeligrosidad() { return estado.nivelPeligrosidad() }
	method bultos() { return estado.bultos() }

	method sufrirCambiosPostCarga() {
		estado = conMisiles
	}

}

object sinMisiles {
	method peso() { return 200 }
	method nivelPeligrosidad() { return 0 }
	method bultos() { return 1 }
}

object conMisiles {
	method peso() { return 300 }
	method nivelPeligrosidad() { return 100 }
	method bultos() { return 2 }
}

object contenedorPortuario {
	var property cosas = #{}

	method peso() { return 100 + self.pesoDeCosas() }
	method bultos() { return 1 + self.bultosDeCosasEnContenedor() }

	method nivelPeligrosidad() {
		if(!cosas.isEmpty()) {
			return self.elMasPeligroso()
		} else {
			return 0
		}
	}

	method pesoDeCosas() { return cosas.sum({cosa => cosa.peso()}) }

	method elMasPeligroso() {
		return cosas.max({cosa => cosa.nivelPeligrosidad()})
	}

	method bultosDeCosasEnContenedor() {
		return cosas.sum({cosa => cosa.bultos()})
	}

	method sufrirCambiosPostCarga() {
		cosas.forEach({cosa => cosa.sufrirCambiosPostCarga()})
	}

}

object residuosRadioactivos {
	var property peso = 0

	method nivelPeligrosidad() { return 200 }
	method bultos() { return 1 }

	method agregarKilos(kg) {
		peso += kg
	}

	method sufrirCambiosPostCarga() {
		self.agregarKilos(15)
	}

}

object embalajeDeSeguridad {
	var property cosaEnvuelta = knightRider

	method peso() { return cosaEnvuelta.peso() }
	method nivelPeligrosidad() { return cosaEnvuelta.nivelPeligrosidad()/2 }
	method bultos() { return 2 }

	method sufrirCambiosPostCarga() {}

}