require 'csv'
owners = CSV.read('support/owners.csv')
#
CSV.foreach('support/owners.csv') do |row1|
  puts row1.inspect
end







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
