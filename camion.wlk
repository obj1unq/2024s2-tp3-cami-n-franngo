import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(cosa) {
		cosas.add(cosa)
	}

	method descargar(cosa) {
		self.validarQueSeTiene(cosa)
		cosas.remove(cosa)
	}

	//validación
	method validarQueSeTiene(cosa) {
		if(!cosas.contains(cosa)) {
			self.error("No se puede descargar del camión una cosa que no se tiene")
		}
	}

	method todoPesoPar() {
		return cosas.all({cosa => self.tienePesoPar(cosa)})
	}

	//auxiliar
	method tienePesoPar(cosa) {
		return cosa.peso()%2==0
	}

	method hayAlgunoQuePesa(peso) {
		return cosas.any({cosa => cosa.peso()==peso})
	}

	method elDeNivel(nivel) {
		return cosas.find({cosa => cosa.nivelPeligrosidad()==nivel})
	}

}
