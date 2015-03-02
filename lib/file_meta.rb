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

  private

  def multiply(size, category)
    ((size * gravity(category)) / 1000000)
  end

  def add(size, category)
    ((size.to_f / 1000000) + gravity(category))
  end

  def extension(category)
    CATEGORIES[category]['extension']
  end

  def gravity(category)
    CATEGORIES[category]['gravity']
  end

  def include_file_type(category, file)
    extension(category).include? file['extension']
  end

  def all_categories
    CATEGORIES.map { |k,v| k }
  end

  def total_ideal_weight
    ideal_weight = 0
    metadata.each { |file| ideal_weight += file['size'] }
    (ideal_weight.to_f / 1000000).round(2)
  end

  public

  def files
    metadata
  end

  def count(category)
    files.select {|file| extension(category).include? file['extension']}.count
  end

  def basic_weight(category)
    weight = 0
    category == 'text' ? files.each { |file| weight = add(file['size'], category) if include_file_type(category, file)} :

    files.each { |file| weight = multiply(file['size'], category) if include_file_type(category, file) }

    weight.round(2)
  end

  def total_basic_weight
    total_weight = 0
    all_categories.each { |category| total_weight += basic_weight(category) }
    total_weight
  end

  def gravity_displacement
    total_basic_weight - total_ideal_weight
  end
end
