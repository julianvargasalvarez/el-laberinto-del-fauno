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
    assert_equal 'Bienvenido al Laberinto del Fauno', last_response.body
  end

  def test_home_with_player_name_shows_current_cell
    header 'X-player', 'nabuconodosor'
    get '/'
    assert last_response.ok?
    content = <<-TEXT
      player: nabuconodosor
      current: af1
      tesoro: linterna
      pista: a
      Aqui esta el fauno
    TEXT
    assert_equal content, last_response.body
    assert_equal 200, last_response.status
  end

  def test_pickup_treasure_and_post_it_to_the_bag
    header 'X-player', 'nabuconodosor'
    header 'X-current', 'af1'
    post '/maleta', 'linterna'
    assert_equal 201, last_response.status
  end

  def test_sacrifises_treasure_to_pan
    header 'X-player', 'nabuconodosor'
    header 'X-current', 'af1'

    post '/maleta', 'linterna' # Pick up the treasure
    delete '/maleta/linterna'  # Sacrifices treasure

    assert_equal 200, last_response.status
  end

  def test_ask_for_exit_with_wrong_password
    header 'X-player', 'nabuconodosor'
    header 'Authorization: Basic b'
    post '/af1'
    assert_equal 401, last_response.status
  end

  def test_ask_for_exit_with_correct_password
    header 'X-player', 'nabuconodosor'
    header 'Authorization: Basic a'
    post '/af1'
    assert_equal 200, last_response.status
    assert_equal "Felicitaciones!!!!", last_response.body
  end

end
