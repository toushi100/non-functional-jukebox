class Music
  attr_accessor :title, :artist, :duration, :genre, :album, :duration,:id
    def initialize(title, artist, duration, genre, album,id=nil)
      self.id=id
      self.title = title
      self.artist = artist
      self.duration = duration
      self.genre = genre
      self.album = album
    end
    def edit(field, new_value)
      self.send("#{field}=", new_value)
    end
    
end