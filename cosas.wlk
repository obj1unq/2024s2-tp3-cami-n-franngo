/*objetos usados para testear los comportamientos del camión mientras aún no se habían modelado los otros objetos
Si se descomentan, se puede volver a probar el primer describe.
 paraTest1 {
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
}

object bumblebee {
	var property estado = robot

	method peso() { return 800 }

	method nivelPeligrosidad() {
		return estado.nivelPeligrosidad()
	}
}

object robot {
	const property nivelPeligrosidad = 30
}

object auto {
	const property nivelPeligrosidad = 15
}

object paqueteDeLadrillos {
	const pesoLadrillo = 2
	var property cantidadDeLadrillos = 0

	method nivelPeligrosidad() { return 2 }
}

object arenaAGranel {
	var property peso = 0
	method nivelPeligrosidad() { return 1 }
}

object bateriaAntiaerea {
	
}

//dividir al objeto bumblebee en coche y robot (ya que, dependiendo de su estado, bumblebee puede ser robot o auto)
//le mando el mensaje a bumblebee y el se encarga de delegar al objeto correspondiente con polimorfismo (SIN IFS)
//nunca preguntarle el estado al objeto. solo delegar (será responsabilidad de ese objeto resolver)


