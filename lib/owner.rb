class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []
  @@owner_count = 0

  def initialize(species)
    @species = species
    @@all << self
    @@owner_count += 1
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def self.all
    @@all
  end

  def self.count
    @@owner_count
  end

  def self.reset_all
    self.all.clear
    @@owner_count = 0
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(fish)
    self.pets[:fishes] << Fish.new(fish)
  end

  def buy_cat(cat)
    self.pets[:cats] << Cat.new(cat)
  end

  def buy_dog(dog)
    self.pets[:dogs] << Dog.new(dog)
  end

  def walk_dogs
    self.pets[:dogs].collect do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].collect do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].collect do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets.each do |type, array|
      array.each do |name|
        name.mood = "nervous"
      end
    end
    self.pets = {fishes: [], cats: [], dogs: []}
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end

end
