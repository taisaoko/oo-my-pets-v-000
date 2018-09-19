class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []
  @@owner_count = 0
 
  def initialize(species)
    @species = species
    @pets = {fishes: [], dogs: [], cats: []}
    @@owner_count += 1
    @@all << self
  end
  
  def self.all
   @@all
  end
  
  def self.reset_all
    self.all.clear
    @@owner_count = 0
  end
  
  def self.count
    @@owner_count
  end
  
  def say_species
    "I am a #@species."
  end
  
  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end
  
  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end
  
  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end
  
  def walk_dogs
    self.pets[:dogs].collect{|dog| dog.mood = "happy"}
  end
    
  def play_with_cats
    self.pets[:cats].collect{|cat| cat.mood = "happy"}
  end
  
  def feed_fish
    self.pets[:fishes].collect{|fish| fish.mood = "happy"}
  end
  
  def sell_pets
    self.pets.collect do |type, pets|
      pets.collect {|pet| pet.mood = "nervous"}
    end
    self.pets.clear
  end
  
  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end
end