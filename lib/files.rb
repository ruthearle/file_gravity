class Files

  attr_accessor :files

  def initialize(files_list)
    self.files = files_list
   #files << files_list
  end

  def list
    formatted_files_list = []
    files.each { |file| formatted_files_list << {'type' => "#{file['name']}.#{file['extension']}", 'size' => "#{file['size']}"}}
    formatted_files_list
    #list = formatted_files_list.map { |file|  p "#{file['type']} #{(file['size'].to_f / 1000000.0).round(10)}"}
    #list
  end

  def total_weight

  end
end
