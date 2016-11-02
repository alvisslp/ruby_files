file_name = ARGV[0]
file = File.open(file_name, 'r+')
w_file = File.open(file_name + '.r_parsed', 'w+')

double_array = {}

file.each do |line|
  next unless line.include?('Push')
  element = line.split(/[\s{]/)[1]
  index = line.split(/[\s{}]/)[2] unless line.split(/[\s{]/)[1].nil?

  double_array[element] ||= {}
  double_array[element][index] ||= 0
  double_array[element][index] = double_array[element][index] + 1
end

double_array.each do |key, value|
  w_file.write("load : #{key}     #{value.size} times\n")
end

w_file.write("\n\n\n\n\n\n")

double_array.each do |key, key_value|
  key_value.each do |key2, value|
    if value > 1
      w_file.write("element #{key} and index #{key2} appears #{value} times\n")
    end
  end
end
