require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "")
    self.name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new = self.new
    self.all << new
    new
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    new = self.new(name)
    self.all << new
    new
  end

  def self.find_by_name(name)
    self.all.find do |song_name|
      song_name.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    file_array = filename.split(" - ")
    file_array[1].slice!(".mp3")
    new_song = self.new(file_array[1])
    new_song.artist_name = file_array[0]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    self.all << new_song
  end

  def self.destroy_all
    @@all = []
  end

end
