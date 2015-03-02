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

  def list
    formatted_files_list = []
    metadata.each { |file| formatted_files_list << {'name' => "#{file['name']}.#{file['extension']}", 'size' => "#{file['size']}"}}
    formatted_files_list
    #list = formatted_files_list.map { |file|  p "#{file['type']} #{(file['size'].to_f / 1000000.0).round(10)}"}
    #list
  end

  def total_weight
    #basic_file_weight = 0
    #files.each { |file| file['extension'].include?(FILE_TYPES['extension']) basic_file_weight += file['size'] * FILE_TYPES[]}

  end
end
