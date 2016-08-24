#Should be able to access the current balance of an account at any time.

# included balance as a param.
# then made it a typical instance variable.
require 'colorize'

module BankAccount
  # new Account class
  class Account
    attr_accessor :name, :id, :balance
# ----------- initializer---------- #
# initialized Method, creating account objects.
    def initialize(name, id, balance)
      @name = name
      @id = id
      # do I have to use "initial"
      @balance = balance
        if @balance < 0
          puts "You cannot do anything."
          raise ArgumentError, "cant create account with negative balance"
        end
      # @reciept = []
    end

# ----------- error handling method ----------- #
    def catch_error(amount)
      raise TypeError, "You lack sufficient funds" if amount == false
      catch_error false
    end

# ----------- withdraw method ----------- #
# the withdraw method does not allow the account to go negative [ ]
# Will puts a warning message [x]
# then return the original un-modified balance [x]

    def withdraw(amount)
      if @balance - amount <= 0
        puts "#{name} you have insuficient funds. Current Balance: $#{@balance}"
        return @balance
      else
        @balance = @balance - amount
        puts "#{name} Withdrew: $#{amount}. New Balance: $#{@balance}"
        return @balance
      end
    end

# ----------- Deposit method ----------- #
    def deposit(amount)
      @balance = @balance + amount
      puts "#{name} Deposited: $#{amount}. New Balance: $#{@balance}.".colorize(:green)

# method that accepts a single parameter which represents the amount of money that will be deposited.
#This method should return the updated account balance.
    end
  end
#module ends
end


# ---- Creating New Acct Objects & giving them aprop arguments ---- #

                                   #name  #id  #balance
account1 = BankAccount::Account.new("Trish", 01, 10)
account1.deposit(10)
account1.withdraw(10)
puts "Balance Now: #{account1.display}"
                                   #name #id  #balance
account2 = BankAccount::Account.new("Frida", 02, 40)
account2.deposit(20)
account2.withdraw(26)
puts "balance $#{account2.balance}"

# account2.display_balance



#---------------------------- Wave 1 -------------------------------#
# Primary Functionality
#
# Create a Bank module which will contain your Account class and any future bank account logic.[x]

# Create an Account class which should have the following functionality:
      # A new account should be created with an ID and an initial balance[x]

      # Should have a withdraw method that accepts a single parameter which represents the amount of money that will be withdrawn. Return the updated account balance.[x]

      # Should have a deposit method that accepts a single parameter which represents the amount of money that will be deposited.Return the updated account balance.[x]

      # Should be able to access the current balance of an account at any time.[x]

# Error Handling #
