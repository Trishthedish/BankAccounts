require 'csv'
require 'colorize'
require 'awesome_print'

# rename item Bank?
module BankAccount
  # credit idea of setting constnats from Rowan.
  WITHDARAWL_FEE = 0
  ACCOUNT_MIN_BALANCE = 0

  class Account
    attr_accessor :id, :balance, :open_date
    # could I make this a hash? So, that I don't have to build it below?
    def initialize(account_info)
      @id = account_info[:id]
      @balance = account_info[:balance]
      @open_date = account_info[:open_date]

      if @balance < self.class::ACCOUNT_MIN_BALANCE
        raise ArgumentError, "cant create account with negative balance"
      end
    end

    def catch_error(amount)
      raise TypeError, "You lack sufficient funds" if amount == false
      catch_error false
    end

    def withdraw(amount)
      if (@balance - (amount + self.class::WITHDARAWL_FEE)) >=
        self.class::ACCOUNT_MIN_BALANCE
          @balance -= (amount + self.class::WITHDARAWL_FEE)
          return @balance
      elsif (@balance - amount) < self.class::ACCOUNT_MIN_BALANCE
        puts "You have insuficient funds"
        return @balance
      end
    end

    def deposit(amount)
      @balance = @balance + amount
      puts "#{name} Deposited: $#{amount}. New Balance: $#{@balance}."
      return @balance
    end

    def self.all(grab_csv)
      id = nil
      balance = nil
      open_date = nil

# changed the naming to semantically reflect the holding of data.
      account_list = []
# changed this to be more explicit about holding my data.
      CSV.foreach(grab_csv) do |row|
        id = row[0]
        balance = row[1] # convert to interger
        open_date = row[2]
        account_inception = {id: id, balance: balance, open_date: open_date}
        account_list << self.new(account_inception)
      end
      account_list
    end

    def self.find(id)
      accounts_search = []
      accounts_search = Bank::Account.all("./support/accounts.csv")

      accounts_search.each do |account|
        if account.id == id
          return account
        end
      end
    end
  end
end



#module ends
# end

##########################
#         WAVE 3         #
# ##########################
# class SavingsAccount < Account
#   def initialize(account_info)
#     @id = account_info[:id]
#     @open_date = open_date[:open_date]
#     @balance = balance[:balance]
#     @@transaction = []
#     if @balance <= 10
#       puts "Problem: you lack funds!"
#       raise ArgumentError "Cannot have less than $10 in your account."
#     end
#   end
#   def self.withdraw(amount)
#    something.each do |transaction|
#      transaction += 2
#    end
#
#   end
# # class end. DONT DELETE.
# end
