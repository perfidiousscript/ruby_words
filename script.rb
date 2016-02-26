fileToOpen = ARGV[0]

file = File.open(fileToOpen, 'r')

word = file.read

$wordObject = {}
$wordArray = []

def arrayConvert(wordListString)
  $wordArray = wordListString.split("\n")
  print "word array: ", $wordArray
  return $wordArray
end

def objectStuff(wordArray)
  $wordArray.each do |word|
    $wordObject[word.to_sym] = {
      :word => word,
      :seq => []
      }
  end
  puts "\n word Object: ", $wordObject.inspect
end

arrayConvert(word)
objectStuff($wordArray)
