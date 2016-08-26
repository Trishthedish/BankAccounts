# simplified example
# good_dog_class.rb

# inheritance is when a class inherits behavior from another class.
# https://launchschool.com/books/oo_ruby/read/inheritance

# class inehriting behavior (children) called, "subclass"
# & the class it inherits from is called the, "super class"

# I. super class
class Animal
  def speak
    "Hello!"
  end
end
# II. GoodDog inherits from sc: Animal
class GoodDog < Animal
  # reader & writer method
  # allows to read and change name attribute ?
  attr_accessor :name
  # create a GoodDog object pass place holder/param (n)
  # Self(spawning)method for name will eventually accept name from argument.

  def initialize(n)
    self.name = n
  end

  def speak
    # self is able to reference its self?
    "#{self.name} says arf!"
  end
end
# Cat inherits Animal super class beahvior
class Cat < Animal
end

sparky = GoodDog.new("Sparky") # creats a new dog object with argument "Sparky"
paws = Cat.new

# because we used self... we can simply use the name passed to it above to use speak method?

puts sparky.speak  # expect "Sparky says arf!"
puts paws.speak   # expect "Hello!"


# So, we have a super class bank account
# which Account is inheriting
# 1. SuperClass = BankAccount

# 2. SubClass = SavingsAccount






########################## EXAMPLE 1.
# Animal happens to be superclass
# class Animal
#   # method for speaking
#   def speak
#     "hello"
#   end
# end

#     GoodDog: is Subclass of
# Super Class: Animal.

#were extracting the speak method to a superclass Animal,
# use inheritance to make behavior available to GoodDog & Cat Classes.

# This means that all of the methods in the Animal class are available to the GoodDog class for use.

 # GoodDog class is inheriting from the Animal class
# class GoodDog < Animal
# end
# # Cat class is inheriting from Animal Class.
# class Cat < Animal
# end
#
# sparky = GoodDog.new  # create a new Gooddog object
# paws = Cat.new  # creating a new Cat object
# # the new GoodDog object named Sparky will inherit Animal's Speak method.
# puts sparky.speak
# # the new Cat object named paws will also inherit Animal's speak method.
# puts paws.speak
