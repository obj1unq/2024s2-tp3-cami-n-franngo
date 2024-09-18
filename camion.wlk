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

	method validarQueSeTiene(cosa) {
		if(!cosas.contains(cosa)) {
			self.error("No se puede descargar del camión una cosa que no se tiene")
		}
	}
}
