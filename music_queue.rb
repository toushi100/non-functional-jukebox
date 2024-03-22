class MusicQueue
  attr_accessor :queue, :current_music,:current_index

  def initialize
    self.current_index = 0
    self.queue = []
  end

  def add(music)
    self.queue << music
    update_current_music_to(0) if self.queue.size == 1
  end

  def remove(music_id)
    return if self.queue.size == 0
    update_current_music_to(music_id+1) if self.current_music.id == music_id
    self.queue.delete_if { |track| track.id == music_id }
  end 

  def stop
    self.queue = []
  end

  def play
  end
  def pause
  end

  def previous
    update_current_music_to(self.current_index - 1) if self.current_index > 0
  end
  def next
    update_current_music_to(self.current_index + 1) if self.current_index < self.queue.size - 1
  end
  private
    def update_current_music_to(index)
      self.current_index = index
      self.current_music = self.queue[self.current_index]
    end
end

