require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find do  | song_item |
      song_item.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else 
      self.create_by_name(name)
      
    end
  end

  def self.alphabetical
    @@all.sort_by { | song | song.name }
  end 

  def self.new_from_filename(file)
    file_array = file.split(" - ")
    song = self.new
    song.artist_name = file_array[0]    
    song.name = file_array[1].split(".")[0]
    song
  end

  def self.create_from_filename(file)
    @@all << self.new_from_filename(file)
  end

  def self.destroy_all
    @@all.clear
  end
end
