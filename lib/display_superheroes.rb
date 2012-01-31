
# 
# Here is where you will write the method #display_superheroes.
# 
# For more information about methods and their parameters I encourage you to 
# read some of the following:
# 
# @see http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls
# @see Programing Ruby, Chapter 6 
#
def printHero (hero)
  puts "Superhero :: "+hero.name+" origin:"+hero.origin+" nemesis:"+hero.nemesis+" nick-name:"+hero.nick_name
end

def display_superheroes (hero_info1, hero_info2=nil)
  
  hash = {}
  if(hero_info1.is_a?Array)
    hero_info1.each do |hero|
       hash[hero.name] = hero
    end
  else
   hash[hero_info1.name] = hero_info1 
  end
  
  if(hero_info2 != nil)
    if(hero_info2.is_a?Array)
      hero_info2.each do |hero|
         hash[hero.name] = hero
      end
    else
     hash[hero_info2.name] = hero_info2
    end
  end  
  
  hash.each do |key,value|
    printHero(value)
  end
end
