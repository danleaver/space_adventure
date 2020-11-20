#user can choose some startup options
#goes on adventure
#there's an outcome

#using classes
#use a gem 'faker'
#pushing to git 

require "faker"

class Beginning
  def initialize
    prompt
  end

  def prompt
    puts "What's your name?"
    @user_name = gets.chomp
    dog_question
  end

  def dog_question
    puts "Do you want to bring along a dog with you to outer space?"
    choice = gets.chomp
      if choice == "yes"
        brings_dog = true
        dog_one = Dog.new
        puts "DOG ONE"
        puts dog_one.get_dogs_name

      elsif choice == "no"
        brings_dog = false
      else 
        dog_question
      end

      @adventure = Adventure.new(@user_name, brings_dog)
      @adventure.your_adventure
  end
end

class Adventure
  attr_accessor :user_name, :brings_dog

  def initialize(user_name, brings_dog)
    @user_name = user_name
    @brings_dog = brings_dog
  end

  def your_adventure
    puts ""
    puts "----------------------"
    puts 
    puts "Welcome #{@user_name}"
    if @brings_dog === true
    puts "you brought a dog"
    else
      puts "you didn't a bring a dog"
    end
  end
end

class Dog 
  def initialize
    @your_dogs_name = Faker::Creature::Dog.name
  end

  def get_dogs_name
    @your_dogs_name 
  end

end

puts "Welcome to your Space Adventure, you're going to be travelling to outerspace, who knows what will happen..."

Beginning.new

