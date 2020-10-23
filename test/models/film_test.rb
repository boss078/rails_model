require 'test_helper'

class FilmTest < ActiveSupport::TestCase
  test 'film_valid' do
    film = Film.new
    film.title = "TestValid"
    film.age_limit = 16
    film.length = Time.new(5400)
    film.rating = 80
    assert film.valid?, true
  end
  test 'film_invalid' do
    film = Film.new
    film.title = "TestValid"
    film.age_limit = -10
    film.length = Time.new(5400)
    film.rating = -1
    assert film.valid?, true
  end
end
