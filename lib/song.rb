require "pry"

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
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
      self.create_by_name(name)
  end

  def self.alphabetical
    name_array = self.all.collect do |song|
      song.name
    end.sort

    name_array.collect do |song_name|
      self.find_by_name(song_name)
    end
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1][0..-5]
    song = self.new_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end

