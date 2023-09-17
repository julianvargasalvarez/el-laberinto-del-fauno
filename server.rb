require 'sinatra'
require_relative 'cell'


mundo = {nabuconudosor: {af1: Celda.new('af1', 'ach', 'rti', 'zlm', 'nac', 'linterna', true)}}

get '/' do
  'Bienvenido al Laberinto del Fauno'
end
