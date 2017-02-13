class Person
  attr_accessor :name, :galleons, :banks
  def initialize(name, amount) 
    @name = name 
    @galleons = amount
    @banks = {}
    
    
    puts "created #{name} with #{amount} galleons"
  end
end

#p = Person.new("Minerva", 4000)
