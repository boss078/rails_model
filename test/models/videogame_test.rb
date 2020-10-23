require 'test_helper'

class VideogameTest < ActiveSupport::TestCase
  test 'videogame_valid' do
    videogame = Videogame.new
    videogame.title = "CoolTitle"
    videogame.platform = "PC"
    videogame.description = "Another cool game for supreme PC platform"
    videogame.release_date = Time.new(2004, 9, 15)
    assert videogame.valid?, true
  end
  test 'videogame_invalid' do
    videogame = Videogame.new
    videogame.title = "NotCoolTitle"
    videogame.platform = "YBox"
    videogame.release_date = Time.new(2077, 9, 15)
    assert videogame.valid?, true
  end
end
