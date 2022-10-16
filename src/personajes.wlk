
class Personaje{  // ?
	var copas = 0
	
	method ganarCopas(copasGanadas) {
		copas += copasGanadas
	}
	
	method perderCopas(copasPerdidas){
		copas-= copasPerdidas
	}
	
	method copas() = copas
	
	method destreza() // ??
}

// hacer un property o escribir un metodo?


class Arquero inherits Personaje{
	const agilidad
	const rango
	
	override method destreza() = agilidad * rango
	
	method tieneEstrategia() = rango > 100

}

class Guerrera inherits Personaje{
	var tieneEstrategia
	const fuerza
	
	override method destreza() = 1.5 * fuerza
	
	method tieneEstrategia() = tieneEstrategia
}

class Ballestero inherits Arquero{
	
	override method destreza() = 2 * super()
	
}

