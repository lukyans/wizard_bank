require "minitest/autorun"
require "minitest/pride"
require "./lib/bank"
require "./lib/person"

class BankTest < Minitest::Test
  def test_it_exists
    bank1 = Bank.new("")
    assert_instance_of Bank, bank1
  end

  def test_it_returns_name
    bank1 = Bank.new("JP Morgan Chase")
    assert_equal "JP Morgan Chase", bank1.name
  end  

  def test_it_creats_second_bank
    bank2 = Bank.new("Wells Fargo")
    assert_equal "Wells Fargo", bank2.name
  end  

  def test_can_open_account
    bank1 = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    result = bank1.open_account(person1)
    message = "An account has been opened for Minerva with JP Morgan Chase"
    assert_equal message, result
    assert_equal 0, person1.banks["JP Morgan Chase"]
    assert_equal "JP Morgan Chase", person1.banks.keys.first
  end

  def test_can_deposit
      bank1 = Bank.new("JP Morgan Chase")
      person1 = Person.new("Minerva", 1000)
      bank1.open_account(person1)
      bank1.deposit(person1, 750)
      assert_equal 750, person1.banks[bank1.name]
      assert_equal 250, person1.galleons
    end

  def test_can_not_deposit
    bank1 = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 5000)
    bank1.open_account(person1)

    expected = "#{person1.name} does not have enough cash to perform this deposit."
    assert_equal expected, bank1.deposit(person1, 5750)
    
  end
  
  def test_can_withdraw
    bank1 = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 500)
    bank1.open_account(person1)
    bank1.deposit(person1, 500)
    bank1.withdrawal(person1, 250)

    assert_equal 250, person1.galleons
    assert_equal 250, person1.banks[bank1.name]
  end
  
  def test_can_not_withdraw
    bank1 = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1500)
    bank1.open_account(person1)
    bank1.deposit(person1, 1500)
    bank1.withdrawal(person1, 2500)

    expected = "#{person1.name} Insufficient funds."
    assert_equal expected, bank1.withdrawal(person1, 2500)
  end
  
  def test_can_not_withdraw
    bank1 = Bank.new("JP Morgan Chase")
    bank2 = Bank.new("Wells Fargo")
    person1 = Person.new("Minerva", 250)
    bank1.open_account(person1)
    bank2.open_account(person1)
    bank1.deposit(person1, 250)
    bank1.transfer(person1, bank2, 250)


    expected = "#{person1.name} has transferred 250 galleons from #{bank1.name} to #{bank2.name}."
    assert_equal expected, bank1.transfer(person1, bank2, 250)
  end
 end