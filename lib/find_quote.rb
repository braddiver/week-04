# 
# Here is where you will write the method #find_quote
# 
# For more information about methods and their parameters I encourage you to 
# read some of the following:
# 
# @see http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls
# @see Programing Ruby, Chapter 6 
#
def find_quote(path, lineNum = nil)
  if(!File.file?(path))  
    return "Could not find a quote at this time"
  end


  lines_total = 0
  index = 0
  quote = "";
  lineArr = [];
  line = ""

  file = File.open(path)
  while (line = file.gets)
    #puts "#{index}: #{line}"
    lineArr[index] = line.strip()
    index = index + 1
  end
  file.close

  if(lineNum == nil or lineNum > index or lineNum < 0)
    rand = 1 + rand(index)
    quote = lineArr[rand]
    #puts "return #{quote}"
    return quote
  end
  quote = lineArr[lineNum]
  #puts "return #{quote}"
  return quote
end

#TEXT_FILE = '/Users/bdiver000/dev/ruby/week-04/spec/fixtures/lebowski.txt'
#quote = find_quote(TEXT_FILE)
#quote = find_quote(TEXT_FILE,3)