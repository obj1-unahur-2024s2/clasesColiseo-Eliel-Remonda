import luchadores.*
import armas.*

class Grupo{
    const property gladiadores = []
    const property nombre  
    var property cantPeleas = 0
    method agregarGladiador(unGladiador){
        gladiadores.add(unGladiador)
    }
    method quitarGladiador(unGladiador){
        gladiadores.remove(unGladiador)
    }

    method elMasFuerte(){
        const puedenPelear = gladiadores.filter({g => g.puedePelear()})
        if (puedenPelear.isEmpty())
            self.error("No hay gladiadores que puedan pelear")
        return puedenPelear.max({g => g.fuerza()})
    }

    method aumentarPeleas(){
        cantPeleas += 1
    }

    method combatirContra(unGrupo){
        self.aumentarPeleas()
        unGrupo.aumentarPeleas()
        (1..3).forEach({
            round=>
            self.elMasFuerte().pelear(unGrupo.elMasFuerte())
        })
    }
}

object coliseo {

    method combateEntreGrupos(unGrupo, otroGrupo){
        unGrupo.combatirContra(otroGrupo)
    }
    method curarGrupo(unGrupo, unValor){
        unGrupo.forEach({g => g.vida(unValor)})
    }

    method curarAGladiador(unGladiador, unValor){
        unGladiador.vida(unValor)
    }
    // falta hacer combatir a un grupo contra un gladiador suelto
}