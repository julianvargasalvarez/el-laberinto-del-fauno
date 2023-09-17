require 'sinatra'
require_relative 'cell'


mundo = {nabuconudosor: {af1: Celda.new('af1', 'ach', 'rti', 'zlm', 'nac', 'linterna', true)}}

get '/' do
  if request.env['HTTP_X_PLAYER'].nil?
    'Bienvenido al Laberinto del Fauno'
  else
    "player: #{request.env['HTTP_X_PLAYER']}"
  end
end
