require 'sinatra'
require_relative 'cell'

$mundo = {
  nabuconodosor: {
    start: 'af1',
    af1: Celda.new('af1', 'ach', 'rti', 'zlm', 'nac', 'linterna', true, 'a'),
    sacrificio_hecho: false,
    password: 'a'
  },

  julian: {
    start: 'af1',
    af1: Celda.new('af1', 'ach',   nil, nil, nil, nil,       false, nil ),
    ach: Celda.new('ach', 'rti', 'af1', nil, nil, 'lintern', false, nil ),
    rti: Celda.new('rti', 'zlm', 'ach', nil, nil, nil,       false, 'a' ),
    zlm: Celda.new('zlm', 'nac', 'rti', nil, nil, nil,       false, nil ),
    nac: Celda.new('nac', nil  , 'zlm', nil, nil, nil,       true,  nil ),
    sacrificio_hecho: false,
    password: 'a'
  },

}

def mundo
  $mundo
end

def pintar(current_user, celda)
    <<-TEXT
      player: #{current_user}
      current: #{celda[:nombre]}
      #{"tesoro: #{celda[:tesoro]}" if celda[:tesoro]}
      #{"pista: #{celda[:pista]}" if celda[:pista]}
      #{"arriba: #{celda[:arriba]}" if celda[:arriba]}
      #{"abajo: #{celda[:abajo]}" if celda[:abajo]}
      #{"derecha: #{celda[:derecha]}" if celda[:derecha]}
      #{"izquierda: #{celda[:izquierda]}" if celda[:izquierda]}
      #{"Aqui esta el fauno\n" if celda[:fauno]}
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

get '/cells/:current_cell' do |current_cell|
  current_user = request.env['HTTP_X_PLAYER']
  if current_user.nil?
    status 401
  else
    datos_celda = traiga(mundo, current_user, current_cell)
    pintar(current_user, datos_celda)
  end
end

post '/cells/:current_cell' do |current_cell|
  current_user = request.env['HTTP_X_PLAYER']
  authorization = request.env['HTTP_AUTHORIZATION']

  if current_user.nil?
    status 401
  else
    if authorization.nil?
      status 401
    else
      cell = traiga(mundo, current_user, current_cell)
      if cell[:fauno] && authorization.split(" ").last.eql?(mundo[current_user.to_sym][:password])
        status 200
        "Felicitaciones!!!!"
      else
        status 401
      end
    end
  end

end

post '/maleta' do
  current_user = request.env['HTTP_X_PLAYER']
  if current_user.nil?
    status 401
  else
    current_cell = request.env['HTTP_X_CURRENT']
    if current_cell.nil?
      status 400
    else
      cell = traiga(mundo, current_user, current_cell)
      request_tesoro = request.body.read.to_s
      if cell[:tesoro].eql?(request_tesoro)
        tesoro = pickup(mundo, current_user, current_cell, request_tesoro)
        mundo[current_user.to_sym][:maleta]=tesoro
        status 201
      else
        status 400
      end
    end
  end
end

get '/maleta' do
  current_user = request.env['HTTP_X_PLAYER']
  if current_user.nil?
    status 401
  else
    status 200
    mundo[current_user.to_sym][:maleta]
  end
end

delete '/maleta/:tesoro' do |tesoro|
  current_user = request.env['HTTP_X_PLAYER']
  if current_user.nil?
    status 401
  else
    current_cell = request.env['HTTP_X_CURRENT']
    cell = traiga(mundo, current_user, current_cell)
    if mundo[current_user.to_sym][:maleta].eql?(tesoro) && cell[:fauno]
      mundo[current_user.to_sym][:maleta]=nil
      mundo[current_user.to_sym][:sacrificio_hecho]=true
      status 200
    else
      status 400
    end

  end
end

