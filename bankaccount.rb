require 'csv'
require 'colorize'
require 'awesome_print'
# CSV.open("BankAccounts/support/owners.csv", "r") do |row|
#   puts line[0]
# end

# require 'csv'
# owners = CSV.read('support/owners.csv')
# #
# CSV.foreach('support/owners.csv') do |row1|
#   puts row1.inspect
# end
# How can you?
# #   1).  Get the Get the Gross Pay of the 3rd employee listed
# puts "Gross Pay of 3rd Employee listed"
#       # [array of object][title of objects]
#       # [in 3 indices][# indice 6]
# puts csv[3][6]

module BankAccount
  # new Account class
  class Account
    # use only: if you wanna access it USE A DOT!
    attr_accessor :id, :balance, :open_date
    @@account_arrays = []

# create accounts from CSV! As a more semantic name.
# "the self keyword allows your to call the method directly on the class and not an instance of the class."
    def self.create_accounts
      # CSV.foreach('support/accounts.csv') do |row1|
      #   # @@account_arrays << self.new
      #   print row1
      # Above Outcome:
      # ["each", "item" "in" "a" "line becomes","array of strings. "]
      #
      # CSV.open('support/accounts.csv').each do |column|
      #   puts "Each line: #{column[0]}"
      # # Above Outcome:
      # # prints column 0, so all of the account nums printed.
      CSV.open('support/accounts.csv').each do |row|
                                    #id    #balance  #date
        @@account_arrays << self.new(row[0], row[1], row[2])
      end
      return @@account_arrays
    end

# method retursn a collection of Account instances  respresenting all accounts


# self.find(id) - returns an instance of Account where the value of the id field in the CSV matches the passed parameter

  #  def self.all
  #    self.createAccounts
  #  end

    # self.find(id) - returns an instance of Account where the value of the id field in the CSV matches the passed parameter[ ]

    def self.find(param_id)
      @@account_arrays.each do |account_object|
        # if the account object id matches the passed in param

        if account_object.id == param_id
          # print that account
          return account_object
        end
      end
    end

  # self.find(id) - returns an instance of Account where the value of the id field in the CSV matches the passed parameter[ ]
  #

# ----------- initializer---------- #
# initialized Method, creating account objects.

      # name, id, balance
    def initialize(id, balance, open_date)
      @id = id
      @balance = balance.to_i
      @open_date = open_date
      # do I have to use "initial"
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
# method that accepts a single parameter which represents the amount of money that will be deposited.
#This method should return the updated account balance.
    def deposit(amount)
      @balance = @balance + amount
      puts "#{name} Deposited: $#{amount}. New Balance: $#{@balance}."

    end
  end
#module ends
end

# id, balance, open_date

allusers = BankAccount::Account.create_accounts
allusers.each do |user|
  puts "Account Id: #{user.id}, Balance: $#{user.balance}, Date Opened: #{user.open_date}"
end
#

BankAccount::Account.create_accounts
finduser = BankAccount::Account.find("1212")
puts "You searched for Account Id: #{finduser.id} Balance: #{finduser.balance} Opening Date:#{finduser.open_date}"


# print allusers
#   # allusers.each do |match|
#   #   puts match
#   #   puts "This is a test"
#   # end



# matches.each do |match|
#   puts match
# end

# BankAccount::Account.all
# ap BankAccount::Account.all

 # .each do ||
 #
 # end


# puts @@account_arrays[0].balance
# puts @@account_arrays[0].open_date

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
