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
    song = self.new
    song.save
    song
  end 


  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end 

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  #returns false if there is no value 
  def self.find_by_name(song_name)
   @@all.find {|songs| songs.name == song_name}
  end
  
   
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) != nil
      self.find_by_name(song_name)
    elsif self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    end
  end
   
   def self.alphabetical
     all = @@all
     all.sort_by(&:name)
   end
   
   def self.new_from_filename(song_and_name)
     #need to use regex to separate song and name string and then create a song.name and song.artist
     separate = song_and_name.split(" - ")
     p separate
     song_artist = separate[0].to_s
     p song_artist
     #song_and_name.match(/\A\w+/).to_s
     song_name = separate[1].match(//).to_s
     #song_and_name.match(//).to_s
     #puts song_artist
     song = self.new
     song.artist_name = song_artist
     song
     
   end
   
   
   

    


end
