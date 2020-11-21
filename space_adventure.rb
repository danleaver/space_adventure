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
        dog_info = dog_one.get_dogs_info

        puts "Your dog is a #{dog_info[:size]} #{dog_info[:breed]} named #{dog_info[:name]}"
        create_adventure(brings_dog, dog_info)
      elsif choice == "no"
        brings_dog = false
        create_adventure(brings_dog)
      else 
        dog_question
      end
    end
    
  def create_adventure(brings_dog, dog_info)
    @adventure = Adventure.new(@user_name, brings_dog)
    value_returned = @adventure.your_adventure 
    puts "your score is #{value_returned}"
    puts brings_dog ? "thanks #{dog_info[:name]}" : "Better luck next time"
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

    type_of_monster = Faker::Games::DnD.monster
    puts "On your journey to outer space suddenly a giant #{type_of_monster} whose name is #{Faker::Name.name_with_middle}. "
    
    puts "press any key to continue"
    gets
    puts "the #{type_of_monster} attacks you."
    
    # if @brings_dog === true
    #   puts "Fortunately your dog saves you. You Win."
    # else
    #   puts "You are killed by the monster. Maybe you should have brought a dog. GAME OVER."
    # end
    puts @brings_dog ? "Fortunately your dog saves you. You Win." : "You are killed by the monster. Maybe you should have brought a dog. GAME OVER."

    random_number = rand(1..10)
    # treasure
  end
end

class Dog 
  def initialize
    @your_dogs_name = Faker::Creature::Dog.name
    @your_dogs_size = Faker::Creature::Dog.size
    @your_dogs_breed =Faker::Creature::Dog.breed
  end

  def get_dogs_info
    {name: @your_dogs_name, size: @your_dogs_size, breed: @your_dogs_breed} 
  end

end

puts "Welcome to your Space Adventure, you're going to be travelling to outerspace, who knows what will happen..."

Beginning.new

