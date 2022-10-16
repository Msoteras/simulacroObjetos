import personajes.*

class Mision{
	var participantes
	const tipo
	
	method copasEnJuego() = tipo.copasEnJuego()
	
	method puedeSerSuperada()
	
	method cantidadDeParticipantes() = participantes.size()
	
}	

class Individuales inherits Mision{
	
	const dificultad
	
	method copasEnJuegoBase() = 2 * dificultad
	
	override method puedeSerSuperada() =
		self.participante().tieneEstrategia() || self.participante().destreza() > dificultad
		
	method participante() = participantes.head()
}

class PorEquipo inherits Mision{
	
	method copasEnJuegoBase() = 50 / self.cantidadDeParticipantes()
	
	override method puedeSerSuperada() = 
		participantes.filter{participante => participante.tieneEstrategia()}.size() > self.cantidadDeParticipantes()/2
		|| participantes.all{participante => participante.destreza() > 400} 
}
	

