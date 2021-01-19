class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # self.create means song.create because self is the class Song
# in this class method, we initialize a song and save it with the .save method. 
#If we look at the .save class method, it's saying 
#that the class itself (song in this case) should be saved to the @@all array.

  def self.create 
    song = self.new 
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

 #self.new_by_name means song.new_by_name
#takes string of song and returns a song instance with that name as its name property

def self.new_by_name(song_name)
  song = self.new 
  song.name = song_name
  song
end

#self.create_by_name means song.create_by_name
#takes string of song and returns a song instance with that name as its name property AND the song saved into @@all
#calls the self.create instance method on the song because we want to save the song which is done in the self.create method

def self.create_by_name(song_name)
  song = self.create     
  song.name = song_name
  song
end

#takes string name of a song and returns matching instance of the song with that song name.

def self.find_by_name(song_name)
  self.all.detect { |song|
    song.name == song_name
  }
end

#takes a string name of a song and either returns a matching song instance with that name or create a new song with the name and returns the song instance.

#uses the find_by_name method to find the song name that returns the matching instance if the song has the same song name.

#uses the create_by_method

def self.find_or_create_by_name(song_name)
  self.find_by_name(song_name) || self.create_by_name(song_name)
end

def self.alphabetical
  self.all.sort_by { |song|
    song.name
  }
end

def self.new_from_filename(filename)
  new_file = filename.split(" - ") #'initializes a song and artist_name based on the filename format'
  artist_name = new_file[0]
  song_name = new_file[1].gsub(".mp3","")
  song = self.new
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.create_from_filename(filename)
  new_file = filename.split(" - ") #'initializes and saves a song and artist_name based on the filename format'
  artist_name = new_file[0]
  song_name = new_file[1].gsub(".mp3","")
  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.destroy_all
  self.all.clear
end
end
