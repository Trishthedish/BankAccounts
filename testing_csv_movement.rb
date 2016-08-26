

array = [1, 2, 3, 4, 5, 6]


def array.find
  array.find(3)
end


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

# a place where I'm storing what things I've learned from accessing the methods after.

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









# require 'csv'
# owners = CSV.read('support/owners.csv')
# #
# CSV.foreach('support/owners.csv') do |row1|
#   puts row1.inspect
# end
#
#
#
#
#
# "each", "item" "in" "a" "line becomes","array of strings. " ]

# CSV.foreach('support/owners.csv') do |row|
#   puts row.inspect
# end



#
# csv_array  = "CSV,String".parse_csv   # from C
#
# CSV.open('support/owners.csv', 'w') do |csv_object|
#   owners.array.each do |row_array|
#     csv_object << row_array
#   end
# end








# owners_array = Array.new
#   CSV.foreach('support/owners.csv') do |row|
#     owners_array << row[2]
#   end
# puts owners_array

# CSV.foreach('support/owners.csv') do |row|
#   puts row.inspect
# end

# csv = []
# CSV.open("support/owners.csv", "wb") do |csv|
#   csv << ["a"]
#   csv << ["another", "row"]
# end
# puts csv
#

#
#
# CSV.open("path/to/file.csv", "wb") do |csv|
#   csv << ["row", "of", "CSV", "data"]
#   csv << ["another", "row"]
#   # ...
# end


# require 'csv'
# foreach.
# this prints out the first column  so 14 - -
# CSV.foreach("support/owners.csv", "r") do |column|
#   puts column[0]
# end


# "r" Read-only, starts at beginning of file (default mode).

# "r+" Read-write, starts at beginning of file.
#
# "w" Write-only, truncates existing file to zero length or creates a new file for writing.
#
# "w+" Read-write, truncates existing file to zero length or creates a new file for reading and writing.
#
# "a" Write-only, starts at end of file if file exists, otherwise creates a new file for writing.
#
# "a+" Read-write, starts at end of file if file exists, otherwise creates a new file for reading and writing.
