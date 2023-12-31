ENV['APP_ENV'] = 'test'

require_relative 'server'
require 'test/unit'
require 'rack/test'

class ServerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_home_without_player_name_shows_welcome_message
    get '/'
    assert last_response.ok?
    assert_include last_response.body, 'El laberinto del Fauno'
  end

  def test_home_with_player_name_shows_current_cell
    header 'X-player', 'nabu'
    get '/'
    content = <<-TEXT
      Player: nabu

      Celda actual: af1
      Tesoro: linterna
      Pista: a
      Arriba: ach
      Abajo: rti
      Derecha: zlm
      Izquierda: nac

      (╯°□°）╯

    TEXT
    assert_equal content, last_response.body
    assert_equal 200, last_response.status
  end

  def test_pickup_treasure_and_post_it_to_the_bag
    header 'X-player', 'nabu'
    header 'X-current', 'af1'
    post '/maleta', 'linterna'
    assert_equal 201, last_response.status
    get '/maleta'
    assert_equal 'En la maleta tienes: linterna', last_response.body
  end

  def test_sacrifises_treasure_to_pan
    header 'X-player', 'nabu'
    header 'X-current', 'af1'

    mundo[:nabu][:af1][:tesoro] = 'linterna'

    post '/maleta', 'linterna' # Pick up the treasure
    assert_equal 201, last_response.status

    delete '/maleta/linterna'  # Sacrifices treasure
    assert_equal 200, last_response.status
  end

  def test_ask_for_exit_with_wrong_password
    header 'X-player', 'nabu'
    header 'Authorization', 'Basic b'
    post '/cells/af1'
    assert_equal 401, last_response.status
  end

  def test_ask_for_exit_with_correct_password
    header 'X-player', 'nabu'
    header 'Authorization', 'Basic a'
    post '/cells/af1'
    assert_equal 200, last_response.status
    assert_include last_response.body, "El Fauno agradece tu visita"
  end

  def test_get_details_for_current_cell
    header 'X-player', 'nabu'
    get '/cells/af1'
    content = <<-TEXT
      Player: nabu

      Celda actual: af1
      Tesoro: linterna
      Pista: a
      Arriba: ach
      Abajo: rti
      Derecha: zlm
      Izquierda: nac

      (╯°□°）╯

    TEXT
    assert_equal content, last_response.body
    assert_equal 200, last_response.status
  end

  def test_get_details_of_an_unexisting_cell
    header 'X-player', 'nabu'
    get '/cells/aaa'
    assert_equal 404, last_response.status
  end
end
