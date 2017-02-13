require "minitest/autorun"
require "minitest/pride"
require "./lib/person"

class PersonTest < Minitest::Test
  def test_it_exists
    person1 = Person.new("Minerva", 1000)
    assert_instance_of Person, person1
  end

  def test_it_has_name
    person1 = Person.new("Minerva", 1000)
    assert_equal "Minerva", person1.name  
  end

  def test_it_has_amount
    person1 = Person.new("Minerva", 1000)
    assert_equal 1000, person1.galleons 
  end

def test_it_can_creat_another_person
    person2 = Person.new("Luna", 500)
    assert_equal "Luna", person2.name
    assert_equal 500, person2.galleons
  end
  
end
