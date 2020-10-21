require 'test_helper'

class CarTest < ActiveSupport::TestCase
  test 'car_valid' do
    car = Car.new
    car.model = "sjndjsnd"
    car.brand = "Nskdnksnd"
    car.license_plate = "NJNJN"
    car.release_date = Time.now
    assert car.valid?, true
  end
  test 'car_with_before_valid' do
    car = Car.new
    car.brand = "Nskdnksnd"
    car.license_plate = "NJNJN"
    car.release_date = Time.now
    assert car.valid?, true
  end
end
