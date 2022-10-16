import personajes.*

class Mision{
	var participantes
	const tipo
	
	method copasEnJuego() = tipo.copasEnJuego(self)
	
	method puedeSerSuperada()
	
	method puedeRealizarse()
	
	method cantidadDeParticipantes() = participantes.size()
		
	
	method realizar() {
		
		if(!self.puedeRealizarse()){
				throw new DomainException(message = "Misión no puede empezar")
				// domain, user o solo exception?
		}
		
		if(self.puedeSerSuperada()){
			participantes.forEach{participante => participante.ganarCopas(self.copasEnJuego())}
		}
	
		else{
			participantes.forEach{participante => participante.perderCopas(self.copasEnJuego())}
		}
	}
	
}	

class Individual inherits Mision{
	
	const dificultad
	
	method copasEnJuegoBase() = 2 * dificultad
	
	override method puedeSerSuperada() =
		self.participante().tieneEstrategia() || self.participante().destreza() > dificultad
	
	override method puedeRealizarse() = self.participante().copas() >= 10
		
	method participante() = participantes.head() // es uno solo
}

class PorEquipo inherits Mision{
	
	method copasEnJuegoBase() = 50 / self.cantidadDeParticipantes()
	
	override method puedeSerSuperada() = 
		participantes.filter{participante => participante.tieneEstrategia()}.size() > self.cantidadDeParticipantes()/2
		|| participantes.all{participante => participante.destreza() > 400} 

	override method puedeRealizarse() = participantes.map{participante => participante.copas()}.sum() > 60
}
	
// tipos de mision
object comun{
	
	method copasEnJuego(mision) = mision.copasEnJuegoBase() 
}

object bonus{
	
	method copasEnJuego(mision) = mision.copasEnJuegoBase() + mision.cantidadDeParticipantes()
}

object boost{
	var multiplicador = 1
	
	method multiplicador(nuevoMultiplicador){
		multiplicador=nuevoMultiplicador
	}
	
	method copasEnJuego(mision) = mision.copasEnJuegoBase() * multiplicador 
}


