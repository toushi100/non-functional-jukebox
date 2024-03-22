require_relative 'jukebox'
require_relative 'user'
require_relative 'music'
user= nil
jukebox = Jukebox.new(user)
main = true
admin = false
puts "\n Welcome to the Jukebox!"
while main
    puts "currently playing song: #{jukebox.currently_playing.title}" unless jukebox.currently_playing.nil?
    puts "#################################################" unless jukebox.currently_playing.nil?
    puts "\n What would you like to do?"
    puts "\t 1. List all songs"
    puts "\t 2. Play a song"
    puts "\t 3. Stop the song"
    puts "\t 4. Next song"
    puts "\t 5. Previous song"
    puts "\t 6. Exit the Jukebox"
    user_input = gets.chomp
    if user_input == "1"
      puts "Here are all the songs:"
      jukebox.list_all_songs
    elsif user_input == "2"
      puts "Which song would you like to play?"
      song_id = gets.chomp.to_i
      jukebox.add_to_queue(song_id)
      puts "currently playing song: #{jukebox.currently_playing.title}" 
    elsif user_input == "3"
      puts "Stopping the song..."
      jukebox.stop
    elsif user_input == "4"
      puts "Playing the next song..."
      jukebox.next
    elsif user_input == "5"
      puts "Playing the previous song..."
      jukebox.previous
    elsif user_input == "6" || user_input == "exit" || user_input == "quit" || user_input == "q" || user_input == "e" || user_input == "x" 
      puts "Exiting the Jukebox..."
      main = false
    elsif user_input == "admin"
      puts "Please enter your username"
      username = "admin"
      puts "Please enter your password"
      password = "admin"
      user = User.new(username, password)
   
      puts "Welcome #{username}!" if  user.admin?
      admin = user.admin?
      
      jukebox.add_admin(user)
      while admin
        puts "\n What would you like to do?"
          puts "\t 1. add a song"
          puts "\t 2. delete a song"
          puts "\t 3. Go back to main menu"
          user_input = gets.chomp
          if user_input == "1"
            puts "Enter the song name"
            title = gets.chomp
            puts "Enter the artist"
            artist = gets.chomp
            puts "Enter the album"
            album = gets.chomp
            puts "Enter the genre"
            genre = gets.chomp
            puts "Enter the duration"
            duration = gets.chomp
            music = Music.new(title, artist, album, genre, duration)
            jukebox.add_music(music)
          elsif user_input == "2"
            puts "Enter the song id"
            song_id = gets.chomp.to_i
            jukebox.remove_music(song_id)
          elsif user_input == "3"
            puts "Going back to main menu..."
            admin = false
          else
            puts "Invalid input. Please try again."
          end
      end

    else
      puts "Invalid input. Please try again."
    end
end
