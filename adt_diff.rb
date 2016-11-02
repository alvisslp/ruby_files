file1 = File.open(ARGV[0], 'r+')
file2 = File.open(ARGV[1], 'r+')

w_name = file1.split(%r{[\/.]})[-2] + '_' + file2.split(%r{[\/.]})[-2]
w_file = File.open(w_name + '.r_diffed', 'w+')

def parse_file(file)
  double_array = {}

  file.each do |line|
    next unless line.include?('Push')
    element = line.split(/[\s{]/).first
    index = line.split(/[\s{}]/)[2] unless line.split(/[\s{]/)[2].nil?

    double_array[element] ||= []
    double_array[element] << index unless double_array[element].include?(index)
  end

  double_array
end

file_array1 = parse_file(file1)
file_array2 = parse_file(file2)

file_array1.each do |key, key_value|
  key_value.sort!
  key_value.each do |key2|
    if !file_array2[key].nil? && file_array2[key].include?(key2)
      w_file.write("the element #{key} with index #{key2} is in both files\n")
    end
  end
end
