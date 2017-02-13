class Bank
  attr_reader :name
  def initialize(name = "")
    @name = name
    puts "#{name} has been created"
  end

  def open_account(client)
    unless client.banks[name]
    client.banks[name] = 0
    "An account has been opened for #{client.name} with #{name}"
    else 
    "Already exists"
    end  
  end

    def deposit(client, amount)
      if client.galleons < amount
        "#{client.name} does not have enough cash to perform this deposit."
      else 
        client.banks[name] += amount
        client.galleons = client.galleons - amount
      end
    end

      def withdrawal(client, amount)
        if client.banks[name] < amount
          "#{client.name} Insufficient funds."
        else
          client.banks[name] -= amount
          client.galleons = client.galleons + amount
        end
      end

      def transfer(client, bank, amount)
      
      
      end
end

#bank1 = Bank.new("JP Morgan Chase")