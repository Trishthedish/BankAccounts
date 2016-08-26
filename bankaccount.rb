require 'csv'
require 'colorize'
require 'awesome_print'

module BankAccount

  # I. new Account class
  class Account
    # use only: if you wanna access it USE A DOT!
    attr_accessor :id, :balance, :open_date
    @@account_arrays = []

# create accounts from CSV! As a more semantic name.
# "the self keyword allows you to call the method directly on the class and not an instance of the class."

    def self.create_accounts
      CSV.open('support/accounts.csv').each do |row|
                                    #id  #balance  #date
        @@account_arrays << self.new(row[0], row[1], row[2])
      end
      return @@account_arrays
    end
# method returns a collection of Account instances  respresenting all accounts


# -----------find method on self ---------- #
    def self.find(param_id)
      @@account_arrays.each do |account_object|
        # if the account object id matches the passed in param
        if account_object.id == param_id
          # print that account
          return account_object
        end
      end
    end

    # self.find(id) - returns an instance of Account where the value of the id field in the CSV matches the passed parameter

# ----------- initializer---------- #
# initialized Method, creating account objects.

      # name, id, balance
    def initialize(id, balance, open_date)
      @id = id
      @balance = balance.to_i
      @open_date = open_date
        if @balance < 0
          puts "You cannot do anything."
          raise ArgumentError, "cant create account with negative balance"
        end
    end

# ----------- error handling method ----------- #
    def catch_error(amount)
      raise TypeError, "You lack sufficient funds" if amount == false
      catch_error false
    end

# ----------- withdraw method ----------- #
# the withdraw method does not allow the account to go negative [x]
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
# method that accepts a single parameter which represents the amount of money that will be deposited.
#This method should return the updated account balance.
    def deposit(amount)
      @balance = @balance + amount
      puts "#{name} Deposited: $#{amount}. New Balance: $#{@balance}."

    end
  end
#module ends
end


##########################
#         WAVE 3         #
##########################
# 1. Create a SavingsAccount class [x]
# which should inherit behavior from the Account class. [x]
class SavingsAccount < Account 

end






#   a.
#
# 2. It should include the following updated functionality:
#       a. initial balance cannot be less than $10. If it is, this will raise an ArgumentError
#       b. Updated withdrawal functionality: Each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance.
#       c. Does not allow the account to go below the $10 minimum balance - Will output a warning message and return the original un-modified balance
# 3. It should include the following new method:
#     a. add_interest(rate): Calculate the interest on the balance and add the interest to the balance.
#     b. Return the interest that was calculated and added to the balance (not the updated balance). Input rate is assumed to be a percentage (i.e. 0.25).
#     1. The formula for calculating interest is balance * rate/100
# Example: If the interest rate is 0.25% and the balance is $10,000, then the interest that is returned is $25 and the new balance becomes $10,025.
#




# ------ Calling things for checking purposes for Wave2------- #

# allusers = BankAccount::Account.create_accounts
# allusers.each do |user|
#   puts "Account Id: #{user.id}, Balance: $#{user.balance}, Date Opened: #{user.open_date}"
# end
# #
#
# BankAccount::Account.create_accounts
# finduser = BankAccount::Account.find("1212")
# puts "You searched for Account Id: #{finduser.id} Balance: #{finduser.balance} Opening Date:#{finduser.open_date}"


# BankAccount::Account.all
# ap BankAccount::Account.all

# puts @@account_arrays[0].balance
# puts @@account_arrays[0].open_date


# Testing purposes #
# ---- Creating New Acct Objects & giving them aprop arguments ---- #

                                   #name  #id  #balance
# account1 = BankAccount::Account.new("Trish", 01, 10)
# account1.deposit(10)
# account1.withdraw(10)
# puts "Balance Now: #{account1.balance}"
#                                    #name #id  #balance
# account2 = BankAccount::Account.new("Frida", 02, 40)
# account2.deposit(20)
# account2.withdraw(26)
# puts "balance $#{account2.balance}"

# account2.display_balance

##########################
#         WAVE 2          #
##########################

# Update the Account class to be able to handle all of these fields from the CSV file used as input.[X]
      #example, manually choose the data from the first line of the CSV file and ensure you can create a new instance of your Account using that data[X]
# Add the following class methods to your existing Account class
      # self.all - returns a collection of Account instances, representing all of the Accounts described in the CSV. See below for the CSV file specifications[X]
      # self.find(id) - returns an instance of Account where the value of the id field in the CSV matches the passed parameter[ ]


#---------------------- Wave 1--------------------------#
# Primary Functionality
#
# Create a Bank module which will contain your Account class and any future bank account logic.[x]

# Create an Account class which should have the following functionality:
      # A new account should be created with an ID and an initial balance[x]

      # Should have a withdraw method that accepts a single parameter which represents the amount of money that will be withdrawn. Return the updated account balance.[x]

      # Should have a deposit method that accepts a single parameter which represents the amount of money that will be deposited.Return the updated account balance.[x]

      # Should be able to access the current balance of an account at any time.[x]

# Error Handling #
