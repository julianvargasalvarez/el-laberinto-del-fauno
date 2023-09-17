require_relative 'cell'
require 'test/unit'

class TestCell < Test::Unit::TestCase
  def test_shows_cell_details_by_cell_name
    # Does not show neighbours
    mundo = {nabuconudosor: {af1: Celda.new('af1', 'ach', 'rti', 'zlm', 'nac', 'linterna', true, 'a')}}
    assert_equal(traiga(mundo, 'nabuconudosor', 'af1'), { nombre: 'af1', tesoro: 'linterna', fauno: true, pista: 'a' })
  end

  def test_shows_cell_neighbors_by_cell_name
    mundo = {nabuconudosor: {af1: Celda.new('af1', 'ach', nil, 'zlm', nil, 'linterna', true, pista: 'a')}}
    assert_equal(arriba(mundo, 'nabuconudosor', 'af1'), 'ach')
    assert_equal(abajo(mundo, 'nabuconudosor', 'af1'), nil)
    assert_equal(derecha(mundo, 'nabuconudosor', 'af1'), 'zlm')
    assert_equal(izquierda(mundo, 'nabuconudosor', 'af1'), nil)
  end

  def test_pickup_treasure_from_cell_by_name_when_there_is_no_treasure
    mundo = {nabuconudosor: {af1: Celda.new('af1', 'ach', nil, 'zlm', nil, nil, true, 'a')}}
    assert_equal(pickup(mundo, 'nabuconudosor', 'af1', 'linterna'), nil)
  end

  def test_pickup_treasure_from_cell_by_name_when_there_is_treasure_but_does_not_match_given_treasure
    # The cell contains a treasure called 'hacha' but the we try to pick up a 'linterna'
    mundo = {nabuconudosor: {af1: Celda.new('af1', 'ach', nil, 'zlm', nil, 'hacha', true, 'a')}}
    assert_equal(pickup(mundo, 'nabuconudosor', 'af1', 'linterna'), nil)
  end

  def test_pickup_treasure_from_cell_by_name_when_there_is_treasure_and_the_treasures_are_equal
    # The cell contains a treasure called 'linterna' and we try to pick up a 'linterna'
    mundo = {nabuconudosor: {af1: Celda.new('af1', 'ach', nil, 'zlm', nil, 'linterna', true, 'a')}}
    assert_equal(pickup(mundo, 'nabuconudosor', 'af1', 'linterna'), 'linterna')

    # By picking up the treasure, the cell now does not contain a treasure
    assert_equal(traiga(mundo, 'nabuconudosor', 'af1'), { nombre: 'af1', fauno: true, pista: 'a' })
  end

end
