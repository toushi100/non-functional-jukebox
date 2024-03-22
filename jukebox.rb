require_relative 'music_queue'
require_relative 'storage'
class Jukebox
attr_accessor :music_queue, :storage, :current_user
  def initialize(user=nil)
    self.music_queue = MusicQueue.new
    self.storage = Storage.new
    self.current_user = user
  end

  def add_to_queue(song_id)
    music = self.storage.get_song_by_id(song_id)
    self.music_queue.add(music)
  end
def currently_playing
    self.music_queue.current_music
end

 def play
   self.music_queue.play
  end

  def stop
    self.music_queue.stop
  end
  
  def next
    self.music_queue.next
  end

  def previous
    self.music_queue.previous
  end
  def add_music(music_track)
    puts "adding music"
    storage.add_music(music_track)
  end

  def remove_music(track_id)
    storage.remove_music(track_id)
  end
  def list_all_songs
  self.storage.storage.each do |music|
    puts "\n"
    puts "Song ID: #{music.id}"
    puts "Song Title: #{music.title}"
    puts "Song Artist: #{music.artist}"
    puts "Song Album: #{music.album}"
    puts "Song Genre: #{music.genre}"
    puts "Song Duration: #{music.duration}"
    end
  end
 def add_admin(user)
    self.current_user = user
    add_user_to_storage(user)
  end
  private
  def add_user_to_storage(user)
    self.storage.user = user
  end
end