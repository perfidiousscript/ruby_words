fileToOpen = ARGV[0]

file = File.open(fileToOpen, 'r')

word = file.read

puts word
