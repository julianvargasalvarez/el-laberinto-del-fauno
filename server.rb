require 'sinatra'
require_relative 'cell'


mundo = {nabuconodosor: {start: 'af1', af1: Celda.new('af1', 'ach', 'rti', 'zlm', 'nac', 'linterna', true, 'a')}}

def pintar(current_user, celda)
    <<-TEXT
      player: #{current_user}
      current: #{celda[:nombre]}
      #{"tesoro: #{celda[:tesoro]}" if celda[:tesoro]}
      #{"pista: #{celda[:pista]}" if celda[:pista]}
      #{"Aqui esta el fauno" if celda[:fauno]}
    TEXT
end

get '/' do
  current_user = request.env['HTTP_X_PLAYER']
  if current_user.nil?
    'Bienvenido al Laberinto del Fauno'
  else
    datos_celda = traiga(mundo, current_user, mundo[current_user.to_sym][:start])
    pintar(current_user, datos_celda)
  end
end
