import grupos.*
import armas.*
class Mirmillones{
    var vida = 100
    const property arma
    var property armadura
    var property fuerza
    method destreza() = 15
    method poderDeAtaque(){
        return arma.poderDeAtaque() + self.fuerza()
    }

    method atacar(unGladiador){
        unGladiador.recibirAtaque(self.poderDeAtaque() - unGladiador.defensa())
    }

    method defensa(){
        return armadura.defensa(self) + self.destreza()
    }

    method recibirAtaque(unValor){
        vida -= unValor
    }

    method pelear(unGladiador){
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }

    method puedePelear() = vida > 1

    method crearGrupo(otroGladiador){
        const nuevoGrupo new Grupo(gladiadores = [self, otroGladiador], 
                            nombre = "mirmillolandia")
        return nuevoGrupo
    }
}

class Dimachaerus{
    var vida = 100
    const property armas = []
    var property destreza
    method fuerza() = 10
    method habilidad() // puse habilidad porque habla que "se valen por su habilidad"
    method poderDeAtaque(){
        return self.fuerza() + armas.sum({a => a.poderDeAtaque()})
    }

    method atacar(unGladiador){
        unGladiador.recibirAtaque(self.poderDeAtaque() - unGladiador.defensa())
        destreza += 1
    }

    method defensa() {
        return destreza * 0.5
    }

    method recibirAtaque(unValor){
        vida -= unValor
    }

    method pelear(unGladiador){
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }

    method puedePelear() = vida > 1

    method crearGrupo(otroGladiador){
        const nuevoGrupo = new Grupo(gladiadores = [self, otroGladiador], 
                            nombre = "D-" + (self.poderDeAtaque() + otroGladiador.poderDeAtaque()))
        return nuevoGrupo
    }
}