require_relative 'music'
require_relative 'file_manager'
class Storage
  attr_accessor :storage, :user
  def initialize(user=nil)
    self.user = user
    self.storage = []
    add_first_track
  end
  def add_music(music)
    return "not authorized" unless user_allowed?
    add_track(music)
  end
  
  def remove_music(track_id)
    return puts "not authorized" unless user_allowed?
    self.storage.delete_if { |music| music.id == track_id }
  end
  def get_song_by_id(track_id)
    self.storage.find { |music| music.id == track_id }
  end
  def save_to_file(filename)
    FileManager.save_to_file(filename, self.storage)
  end
  def load_from_file(filename)
    self.storage = FileManager.load_from_file(filename)
  end
  private
  def add_track(music)
    music.id = get_last_track_id + 1
    self.storage << music
  end
  def get_last_track_id
    return 0 if self.storage.empty?
    self.storage.last.id
  end
  def user_allowed?
    return false if user.nil? || !user.admin?
    return true
  end
  def add_first_track
    music = Music.new("Hello", "Adele", "25", "pop", "4:00")
    add_track(music)
    music = Music.new("Sail", "Awolnation", "Megalithic Symphony", "rock", "4:00")
    add_track(music)
    music = Music.new("Bad Blood", "Bastille", "Bad Blood", "pop", "4:00")
    add_track(music)
  end
end