require 'test/unit'

Celda = Struct.new('Celda', :nombre, :arriba, :abajo, :derecha, :izquierda, :tesoro, :fauno)

def traiga(mundo, laberinto, celda)
  mundo[laberinto.to_sym][celda.to_sym].to_h.compact
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

class TestCell < Test::Unit::TestCase
  def test_shows_cell_details_by_cell_name
    mundo = {nabuconudosor: {af1: Celda.new('af1', nil, nil, nil, nil, 'linterna', true)}}
    assert_equal(traiga(mundo, 'nabuconudosor', 'af1'), { nombre: 'af1', tesoro: 'linterna', fauno: true })
  end

  def test_shows_cell_neighbors_by_cell_name
    mundo = {nabuconudosor: {af1: Celda.new('af1', 'ach', nil, 'zlm', nil, 'linterna', true)}}
    assert_equal(arriba(mundo, 'nabuconudosor', 'af1'), 'ach')
    assert_equal(abajo(mundo, 'nabuconudosor', 'af1'), nil)
    assert_equal(derecha(mundo, 'nabuconudosor', 'af1'), 'zlm')
    assert_equal(izquierda(mundo, 'nabuconudosor', 'af1'), nil)
  end
end
