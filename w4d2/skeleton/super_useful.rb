# PHASE 2
# Integer("string")
# class IntegerConversionError < ArgumentError; end

  def convert_to_int(str)
    
    Integer(str)
  rescue ArgumentError => err
    puts "Can't convert string to Integer #{err}"
      # nil
    
  end
# p convert_to_int("30")
class FruitError < StandardError; end
# PHASE 3
FRUITS = ["apple", "banana", "orange"] 

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise FruitError.new("I don't like that fruit!") 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
rescue 
  "Give me coffee if you want to feed me another fruit:"
    retry
  end
end  

# reaction("apple")
feed_me_a_fruit

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


