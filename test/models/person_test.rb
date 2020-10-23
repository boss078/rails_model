require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test 'person_valid' do
    person = Person.new
    person.name = "Normal"
    person.surname = "Guy"
    person.age = 25
    person.date_of_birth = Time.new(2000, 10, 10)
    person.biography = "Something here"
    assert person.valid?, true
  end
  test 'person_invalid' do
    person = Person.new
    person.name = "Kid"
    person.surname = "Kid"
    person.age = 2000
    person.date_of_birth = Time.new(2005, 10, 10)
    person.biography = "Something here"
    assert person.invalid?, true
  end
end
