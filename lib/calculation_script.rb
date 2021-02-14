require 'csv'
puts 'CalcScript initialized.'

# create arrays to store x and y values
x_values = Array.new
y_values = Array.new

# extract x and y values from CSV file
contents = CSV.open('pre.csv', headers: true, header_converters: :symbol)

# add values to respective arrays
contents.each do |row|
  x = row[:x_coordinates].to_f
  y = row[:y_coordinates].to_f

  x_values << x
  y_values << y
end

# create an array for distance values
distances = Array.new

i = 0
while x_values[i + 1].class == Float do
  distances << ( ( x_values[i + 1] - x_values[i] )**2 + ( y_values[i + 1] - y_values[i] )**2 )**0.5 
  
  i += 1
end

# calculate the DAVE value
dave = distances.reduce(0){ |sum, value| sum + value } / distances.length
puts "#{dave}"