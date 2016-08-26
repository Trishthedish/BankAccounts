require 'csv'
require 'colorize'
require 'awesome_print'
require 'time'
# rename item Bank?
module BankAccount
  # credit idea of setting constnats from Rowan.


  class Account

    attr_accessor :id, :balance, :open_date
    # could I make this a hash? So, that I don't have to build it below?

    def initialize(account_info)
      @id = account_info[:id]
      @balance = account_info[:balance]
      @open_date = account_info[:open_date]
      @withdraw_fee = 0
      @account_min_balance = 0

      if @balance < @account_min_balance
        # why should I initialize argument error?
        raise ArgumentError, "cant create account with negative balance"
      end
    end

    # def catch_error(amount)
    #   raise TypeError, "You lack sufficient funds" if amount == false
    #   catch_error false
    # end
    def to_s
      return "Account ID: #{id}, Balance: #{balance}, Open Date: #{open_date}".colorize(:blue)
    end

    def withdraw(amount)
      if (@balance - (amount + self.class::withdraw_fee)) >=
        self.class::account_min_balance
          @balance -= (amount + self.class::withdraw_fee)
          return @balance
      elsif (@balance - amount) < self.class::account_min_balance
        puts "That's impossible you cannot create account with insuficient funds."
        return @balance
      end
    end

    def deposit(amount)
      @balance = @balance + amount
      # puts "#{name} Deposited: $#{amount}. New Balance: $#{@balance}."
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
        balance = row[1].to_i # convert to interger
        open_date = row[2]
        account_inception = {id: id, balance: balance, open_date: open_date}
        account_list << self.new(account_inception)
      end
      account_list
    end

    def self.find(id)
      accounts_search = []
      accounts_search = BankAccount::Account.all("./support/accounts.csv")

      accounts_search.each do |account|
        if account.id == id.to_s
          return account
        end
      end
    end
  end


#
## :id, ##:balance, ##:open_date
account1 = BankAccount::Account.new({:id => 2200, :balance => 30000, :open_date => Time.parse('2016-01-17 12:12:12 -0800')})
puts account1
# output: Id: 2200, Balance: 30000, Open Date: 2016-01-17 12:12:12 -0800


  class SavingsAccount < Account
# Input rate is assumed to be a percentage (i.e. 0.25).
# The formula for calculating interest is balance * rate/100
  # starting of my counter at zero
  @checks_used_in_month = 0

  def initialize(account_info)
      super
      @withdraw_fee = 2
      @account_min_balance = 10
# The initial balance cannot be less than $10.
      if @account_min_balance < 10
#If it is, this will raise an ArgumentError
        raise ArgumentError, "your account balance is < $10"
      else
        return "Balance: #{@balance}"
      end
  end
# Updated withdrawal functionality:
# Each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance.
    def withdraw_with_check(amount)
      if(@balance - amount) > -1000 && @checks_used_in_month < 3
        @balance -=amount
        return @balance
      end
    end
#add_interest(rate): Calculate the interest on the balance and add the interest to the balance. Return the interest that was calculated and added to the balance (not the updated balance).
    def add_interest(rate=0.25)
      interest = @balance * rate / 100.0
      @balance += interest
      return interest
    end
  end


# account1 = BankAccount::SavingsAccount.new({:id => 2200, :balance => 30000, :open_date => Time.parse('2016-01-17 12:12:12 -0800')})
# puts account1.add_interest()

# Create a CheckingAccount class which should inherit behavior from the Account class.
  class CheckingAccount < Account
  # Create a CheckingAccount class which should inherit behavior from the Account
      @withdraw_fee = 100
      @check_fee = 200

      def initialize(account_info)
        super
        @checks_used_in_month = 0
      end
# Updated withdrawal functionality:
      def withdraw_with_check(amount)
        if(@balance - amount) > -1000 && @checks_used_in_month < 3
          @balance -=amount
# Each withdrawal 'transaction' incurs a fee of $1 that is taken out of the balance.
          @checks_used_in_month += 1
#  Returns the updated account balance.
          return @balance
        elsif (@balance - amount) > -1000 && @checks_used_in_month >=3
          @balance -= (amount + @@check_fee)
          @checks_used_in_month +=1
          return @balance
        else
          puts "You don't have any $$ to write any checks, fool! Current Balance: #{@balance}"
        end
      end
  end
end


account1 = BankAccount::CheckingAccount.new({:id => 2200, :balance => 30000, :open_date => Time.parse('2016-01-17 12:12:12 -0800')})
puts account1.withdraw_with_check(200)



=begin
    Create a CheckingAccount class which should inherit behavior from the Account class. It should include the following updated functionality:

    Updated withdrawal functionality:
    Each withdrawal 'transaction' incurs a fee of $1 that is taken out of the balance. Returns the updated account balance.

    Does not allow the account to go negative. Will output a warning message and return the original un-modified balance.

    #withdraw_using_check(amount): The input amount gets taken out of the account as a result of a check withdrawal. Returns the updated account balance.
    Allows the account to go into overdraft up to -$10 but not any lower
    The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
    #reset_checks: Resets the number of checks used to zero
=end
#
# def reset_checks
#     @checks_used_in_month = 0
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
