fileToOpen = ARGV[0]

file = File.open(fileToOpen, 'r')

word = file.read

$wordObject = {}
$wordArray = []
$seqList = {}

def arrayConvert(wordListString)
  $wordArray = wordListString.split("\n")
  #print "word array: ", $wordArray
  return $wordArray
end

def objectStuff(wordArray)
  wordArray.each do |word|
    $wordObject[word] = {
      word: word,
      "seq" => word.split("")
      }
  end
  #puts "\n word Object: ", $wordObject.inspect
end

def perm(objectList)
  objectList.each do |word, value|
    #puts "word is: ", value["seq"]
    if value["seq"].length > 3
      for i in 0...(value["seq"].length - 3)
        newSeq = ""
        newSeq = value["seq"][i] + value["seq"][i+1] + value["seq"][i+2] + value["seq"][i+3]
        if $seqList[newSeq.to_sym]
          $seqList[newSeq.to_sym]["is_duplicate"] = true
        else
          $seqList[newSeq.to_sym] = {
            "seq" => newSeq,
            "word" => word
          }
        end
      end
    end
  end
end

def writeFiles(sequenceList)
  wordOutput = File.open('word_output.txt','w')
  sequenceOutput = File.open('sequence_output.txt','w')
  sequenceList.each do |key,value|
    unless value["is_duplicate"] == true
      wordOutput.write(value["word"] + "\n")
      sequenceOutput.write(value["seq"] + "\n")
    end
  end
end

arrayConvert(word)
objectStuff($wordArray)
perm($wordObject)
writeFiles($seqList)
