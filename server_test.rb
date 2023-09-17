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
    TEXT
    assert_equal content, last_response.body
  end
end
