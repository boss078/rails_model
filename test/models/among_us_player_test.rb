require 'test_helper'

class AmongUsPlayerTest < ActiveSupport::TestCase
  test 'player_valid' do
    player = AmongUsPlayer.new
    player.nickname = "Crewmate"
    player.is_imposter = true
    player.completed_tasks = 10
    assert player.valid?, true
  end
  test 'player_invalid' do
    player = AmongUsPlayer.new
    player.nickname = "Imposter"
    player.is_imposter = false
    player.completed_tasks = -5
    assert player.invalid?, true
  end
end
