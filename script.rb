fileToOpen = ARGV[0]

file = File.open(fileToOpen, 'r')

word = file.read

def seqSearch(wordListString)
  wordArray = wordListString.split("\n")
  print wordArray
end

seqSearch(word)
