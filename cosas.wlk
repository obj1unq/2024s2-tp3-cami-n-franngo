object paraTest1 {
	method peso() { return 201 }
	method nivelPeligrosidad() { return 5 }
}

object paraTest2 {
	method peso() { return 1200 }
	method nivelPeligrosidad() { return 15 }
}

object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

//dividir al objeto bumblebee en coche y robot (ya que, dependiendo de su estado, bumblebee puede ser robot o auto)
//le mando el mensaje a bumblebee y el se encarga de delegar al objeto correspondiente con polimorfismo (SIN IFS)
//nunca preguntarle el estado al objeto. solo delegar (será responsabilidad de ese objeto resolver)


