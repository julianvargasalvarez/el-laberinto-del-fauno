Celda = Struct.new('Celda', :nombre, :arriba, :abajo, :derecha, :izquierda, :tesoro, :fauno, :pista)

def traiga(mundo, laberinto, celda)
  mundo[laberinto.to_sym][celda.to_sym].to_h.compact.except(:arriba, :abajo, :derecha, :izquierda)
end

def arriba(mundo, laberinto, celda)
  mundo[laberinto.to_sym][celda.to_sym].to_h[:arriba]
end
def abajo(mundo, laberinto, celda)
  mundo[laberinto.to_sym][celda.to_sym].to_h[:abajo]
end
def derecha(mundo, laberinto, celda)
  mundo[laberinto.to_sym][celda.to_sym].to_h[:derecha]
end
def izquierda(mundo, laberinto, celda)
  mundo[laberinto.to_sym][celda.to_sym].to_h[:izquierda]
end

def pickup(mundo, laberinto, celda, tesoro)

  celda = mundo[laberinto.to_sym][celda.to_sym]
  tesoro_en_celda = celda.to_h[:tesoro]
  if tesoro_en_celda.eql? tesoro
    celda.tesoro = nil
    tesoro
  end
end
