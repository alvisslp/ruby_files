a = ARGV[0].dup

def rot1(val)
  val.tr!('abcdefghijklmnopqrstuvwxyz', 'bcdefghijklmnopqrstuvwxyza')
end

26.times do
  a = rot1(a)
  puts a
end
