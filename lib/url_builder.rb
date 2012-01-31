

# 
# Here is where you will write the #url_builder method that are defined in the 
# associated specifications file.
# 
# For more information about methods and their parameters I encourage you to 
# read some of the following:
# 
# @see http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls
# @see Programing Ruby, Chapter 6 
#

def url_builder (url, param = nil)
  if(param.is_a?(Hash))
    q = []
    param.map do |key, value|
      if(value != nil)
        q.push("#{key}=#{value}")
      end
    end
    return "#{url}?#{q.join("&")}"
  end
  return "#{url}?results=10"
end

#url_builder(url,:results => '20',:search => 'burgers',:sort_by => nil)
