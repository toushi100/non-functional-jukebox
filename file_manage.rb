class FileManager
  def self.read_file(file)
    File.open(file, 'r') do |f|
      f.each_line do |line|
        puts line
      end
    end
  end

  def self.write_file(file, text)
    File.open(file, 'w') do |f|
      f.write(text)
    end
  end
end
