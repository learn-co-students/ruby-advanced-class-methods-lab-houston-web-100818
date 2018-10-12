require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    #USE THIS TO SAVE INTO @@ALL, READ THE CODE!!!
    self.class.all << self
  end

  def self.create
    # initializes a song and saves it to the @@all class variable either literally or through the class method
    song = self.new
    song.save
    #RETURN THE SONG
    song

  end

  def self.create_by_name(name)
    #instantiates & saves a song with a name property
    song = self.new
    song.name = name
    song.save 
    song
  end

  def self.new_by_name(name)
    #takes in a string name of a song and returns a SONG INSTANCE WITH THAT NAME SET AS ITS NAME PROPERTY
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name_to_look_for)
    self.all.find {|song| song.name == name_to_look_for}
   # binding.pry

  end

  def self.find_or_create_by_name(name)
   # binding.pry
    found = self.find_by_name(name)
    if found.nil?
       self.create_by_name(name) 
    else
      found

      #binding.pry

    #unless self.all.include?(name)
    end
#binding.pry
  end

  def self.alphabetical #class method (constructor)
    #why did @@all.sort_by work but self.all.sort_by didnt?
   self.all.sort_by {|x| x.name}
  
  end

  def self.new_from_filename(file)
    artist = file.split(" - ")[0]
    song = file.split(" - ")[1].chomp(".mp3")
    s = self.new_by_name(song)
    s.artist_name = artist
    s
    
  end

  def self.create_from_filename(file)
    artist = file.split(" - ")[0]
    song = file.split(" - ")[1].chomp(".mp3")
    # s = self.new_by_name(song)
    found = self.find_by_name(song)
    if found.nil?
      s = self.new_by_name(song)
    s.artist_name = artist
    s
    else
      found
    end


  end

  def self.destroy_all
    self.all.clear
  end


end
