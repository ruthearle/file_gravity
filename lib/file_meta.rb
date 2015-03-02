class FileMeta

  attr_accessor :metadata, :file_types
    FILE_TYPES = YAML::load_file('file_types.yml')

  def initialize(files)
    self.metadata = files.to_a
  end

  def list
    formatted_files_list = []
    metadata.each { |file| formatted_files_list << {'type' => "#{file['name']}.#{file['extension']}", 'size' => "#{file['size']}"}}
    formatted_files_list
    #list = formatted_files_list.map { |file|  p "#{file['type']} #{(file['size'].to_f / 1000000.0).round(10)}"}
    #list
  end

  def total_weight
    #basic_file_weight = 0
    #files.each { |file| file['extension'].include?(FILE_TYPES['extension']) basic_file_weight += file['size'] * FILE_TYPES[]}

  end
end
