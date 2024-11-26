class ArmaDeFilo{
  var property filo
  const property longitud 
  method poderAtaque() = filo * longitud
}

class ArmaContundente{
  const property peso
  method poderAtaque() = peso
}

object casco{
  method defensa(unGladiador) = 10
}

object escudo{
  method defensa(unGladiador) = 5 + (unGladiador.destreza() * 0.1)
}