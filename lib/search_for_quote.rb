# 
# Here is where you will write the method #search_for_quote
# 
# For more information about methods and their parameters I encourage you to 
# read some of the following:
# 
# @see http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls
# @see Programing Ruby, Chapter 6 
#
def search_for_quote (fileInfo)
  if(!File.file?(fileInfo[:file]))
    return []
  end

  include = fileInfo[:include]
  start_with = fileInfo[:start_with]
  end_with = fileInfo[:end_with]

  lines_total = 0
  index = 0
  quote = ""
  lineArr = []
  resultArr = []
  resultCount = 0
  line = ""

  addResult = Proc.new {|ln|
    if(!resultArr.include?(ln))
      resultArr[resultCount] = ln
      resultCount += 1
    end
  }

  file = File.open(fileInfo[:file])
  while (line = file.gets)
    #puts "#{index}: #{line}"
    ln = line.strip()
    lineArr[index] = ln
    if(include.is_a?(String) && include.length > 0)
       if(ln.include?(include))
          addResult.call(ln)
       end
    end
    if(start_with.is_a?(String) and start_with.length > 0)
       if(ln.match(/^#{start_with}/))
          addResult.call(ln)
       end
    end
    if(end_with.is_a?(String) and end_with.length > 0)
       if(ln.match(/#{end_with}$/))
          if(!resultArr.include?(ln))
            addResult.call(ln)
          end
        end
    end
    index = index + 1
  end
  file.close


  return resultArr.length > 0 ? resultArr : lineArr

end
TEXT_FILE = '/Users/bdiver000/dev/ruby/week-04/spec/fixtures/lebowski.txt'
results = search_for_quote(:file => TEXT_FILE,:include => "dude")