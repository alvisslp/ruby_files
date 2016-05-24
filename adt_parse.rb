file_name = ARGV[0]
file = File.open(file_name, 'r+')
w_file = File.open(file_name + '.r_parsed', 'w+')

double_array = {}

file.each do |line|
  next unless line.include?('Push')
  element = line.split(' ')[1].split('{').first
  index = line.split(' ')[1].split('{')[1].split('}').first unless line.split(' ')[1].split('{')[1].nil?

  double_array[element] = {} unless double_array.key?(element)
  double_array[element][index] = 0 unless double_array[element].key?(index)
  double_array[element][index] = double_array[element][index] + 1
end

double_array.each do |key, value|
  w_file.write("load : #{key}     #{value.size} times\n")
end

w_file.write("\n\n\n\n\n\n")

double_array.each do |key, key_value|
  key_value.each do |key_2, value|
    w_file.write("the element #{key} with index #{key_2} appears #{value} times\n") if value > 1
  end
end
