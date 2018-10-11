require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = Song.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = Song.new 
    song.name = name 
    song
  end
  
  def self.create_by_name(name)
    song = Song.new 
    song.name = name 
    self.all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|s| s.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    sp = filename.split(" - ")
    song = self.new_by_name(sp[1][0..-5])
    song.artist_name = sp[0]
    song
  end
  
  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
