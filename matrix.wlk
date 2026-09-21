object neo {
  var energia = 100
  
  method esElElegido() = true
  
  method saltar() {
    energia /= 2
  }
  
  method vitalidad() = energia / 10
}

object morfeo {
  var vitalidad = 8
  var estaCansado = false
  
  method esElElegido() = false
  
  method saltar() {
    estaCansado = not estaCansado
    vitalidad = (vitalidad - 1).max(0)
  }
  
  method vitalidad() = vitalidad
}

object trinity {
  method vitalidad() = 0
  
  method esElElegido() = false
  
  method saltar() {
    
  }
}

object nave {
  const pasajeros = []
  
  method pasajeros() = pasajeros
  
  method subirPasajeros(unPasajero) {
    pasajeros.add(unPasajero)
  }
  
  method bajarPasajeros(unPasajero) {
    pasajeros.remove(unPasajero)
  }
  
  method cantidadPasajeros() = pasajeros.size()
  
  method elPasajeroConMasVitalidad() = pasajeros.max({ p => p.vitalidad() })
  
  method laMayorVitalidad() = self.elPasajeroConMasVitalidad().vitalidad()
  
  method estaElElegido() = pasajeros.any({ p => p.esElElegido() })

  method chocar() {
    pasajeros.forEach({p => p.saltar()})
    pasajeros.clear()
  }

  method acelerar(){
    pasajeros.filter({p => not p.esElElegido()}).forEach({p => p.saltar()})
  }
}