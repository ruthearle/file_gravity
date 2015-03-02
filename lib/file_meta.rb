class FileMeta

  attr_accessor :metadata
  CATEGORIES =  {
                 "document" => {"extension" => ['doc', 'docx', 'pages', 'odt', 'rtf'], "gravity" => 1.1},
                 "song"     => {"extension" => ['mp3', 'wma', 'wav', 'm4a'], "gravity" => 1.2 },
                 "video"    => {"extension" => ['avi', 'mp4', 'mpg', 'mov', 'wmv', 'flv'], "gravity" => 1.4 },
                 "text"     => {"extension" => ['txt'], "gravity" => 100},
                 "other"    => {"extension" => [], "gravity" => 1.0}
                }

  def initialize(list)
    self.metadata = list
  end

  def files
    metadata
  end

  def count(category)
    files.select {|file| extension(category).include? file['extension']}.count
  end

  def basic_weight(category)
    basic_weight = 0
    category == 'text' ? files.each { |file| basic_weight = add(file['size'], category) if extension(category).include? file['extension'] } :

    files.each { |file| basic_weight = multiply(file['size'], category) if extension(category).include? file['extension'] }

    basic_weight.round(2)
  end

  def multiply(size, category)
    ((size * gravity(category)) / 1000000)
  end

  def add(size, category)
    ((size / 1000000) + gravity(category))
  end

  def extension(category)
    CATEGORIES[category]['extension']
  end

  def gravity(category)
    CATEGORIES[category]['gravity']
  end

  def file_type(category)
   
  end

end
