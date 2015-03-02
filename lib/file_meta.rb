class FileMeta

  attr_accessor :metadata
  CATEGORIES =  {"document" => {"extension" => ['doc', 'docx', 'pages', 'odt', 'rtf'], "gravity" => 1.1}, 
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

  def total_weight
    #basic_file_weight = 0
    #files.each { |file| file['extension'].include?(FILE_TYPES['extension']) basic_file_weight += file['size'] * FILE_TYPES[]}

  end
end
