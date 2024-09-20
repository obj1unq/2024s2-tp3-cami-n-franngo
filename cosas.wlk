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
}

object bumblebee {
	var property estado = robot

	method peso() { return 800 }
	method nivelPeligrosidad() { return estado.nivelPeligrosidad() }
	method bultos() { return 2 }
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
}

object arenaAGranel {
	var property peso = 0

	method nivelPeligrosidad() { return 1 }
	method bultos() { return 1 }

	method agregarKilos(kg) {
		peso += kg
	}
}

object bateriaAntiaerea {
	var property estado = sinMisiles

	method peso() { return estado.peso() }
	method nivelPeligrosidad() { return estado.nivelPeligrosidad() }
	method bultos() { return estado.bultos() }
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
}

object residuosRadioactivos {
	var property peso = 0

	method nivelPeligrosidad() { return 200 }
	method bultos() { return 1 }
}

object embalajeDeSeguridad {
	var property cosaEnvuelta = knightRider

	method peso() { return cosaEnvuelta.peso() }
	method nivelPeligrosidad() { return cosaEnvuelta.nivelPeligrosidad()/2 }
	method bultos() { return 2 }
}

//dividir al objeto bumblebee en coche y robot (ya que, dependiendo de su estado, bumblebee puede ser robot o auto)
//le mando el mensaje a bumblebee y el se encarga de delegar al objeto correspondiente con polimorfismo (SIN IFS)
//nunca preguntarle el estado al objeto. solo delegar (será responsabilidad de ese objeto resolver)


