import cosas.*

object camion {
	const property cosas = #{}
	const pesoTara = 1000
	const pesoMaximo = 2500
		
	method cargar(cosa) {
		almacen.sacarSiEsta(cosa) //SE SACA SI ESTÁ AHÍ, esto debido a que no tendría sentido que una cosa estuviese en 2 lugares distintos
		cosas.add(cosa)
		cosa.sufrirCambiosPostCarga()
	}

	method descargar(cosa) { 
		self.validarQueSeTiene(cosa) //esto primero porque es lo que puede tirar excepción
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

	method pesoTotal() {
		return pesoTara + self.pesoCarga()
	}

	//auxiliar
	method pesoCarga() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method excedidoDePeso() {
		return self.pesoTotal() > pesoMaximo
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => self.objetoSuperaPeligrosidad(cosa, nivel)})
	}

	//auxiliar
	method objetoSuperaPeligrosidad(cosa, nivel) {
		return cosa.nivelPeligrosidad() > nivel
	}

	method objetosMasPeligrososQueCosa(cosaComparada) {
		return cosas.filter({cosa => self.objetoEsMasPeligrosoQue(cosa, cosaComparada)})
	}

	//auxiliar
	method objetoEsMasPeligrosoQue(cosa, cosaComparada) {
		return cosa.nivelPeligrosidad() > cosaComparada.nivelPeligrosidad()
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return !self.excedidoDePeso() && !self.hayMasPeligrosoQue(nivelMaximoPeligrosidad)
	}

	//auxiliar
	method hayMasPeligrosoQue(nivel) {
		return !(self.objetosQueSuperanPeligrosidad(nivel).isEmpty())
	}

	method tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({cosa => cosa.peso()>=min && cosa.peso()<=max})
	}

	method cosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}

	method pesos() {
		return cosas.map({cosa => cosa.peso()}) //map devuelve lista
	}

	method totalBultos() {
		return cosas.sum({cosa => cosa.bultos()})
	}

	method transportar(destino) {
		cosas.forEach({cosa => self.descargar(cosa,destino)})
	}

	method descargar(cosa, destino) {
		self.validarQueSeTiene(cosa) //esto primero porque es lo que puede tirar excepción
		cosas.remove(cosa)
		destino.colocar(cosa)
	}

	method descargarSiEsta(cosa) {
		if(cosas.contains(cosa)) {
			cosas.remove(cosa)
		}
	}

}

object almacen {
	const property cosas = #{}

	method sacarSiEsta(cosa) {
		if(cosas.contains(cosa)) {
			cosas.remove(cosa)
		}
	}

	method colocar(cosa) {
		camion.descargarSiEsta(cosa) //SE SACA SI ESTÁ AHÍ, esto debido a que no tendría sentido que una cosa estuviese en 2 lugares distintos
		cosas.add(cosa)
	}

}
