class FileMeta

  attr_accessor :list, :weight

  CATEGORIES = YAML::load_file('config/categories.yml')
  MB = 1000000

  def initialize(list)
    @list = list
  end

  def count(category)
    list.select {|file| extension(category).include? file['extension']}.count
  end

  def basic_weight(category)
    weight = 0
    # could use reduce but have to figure out how to. Will probably have to refactor a few methods
    #category == 'text' ? add_basic(category) : multiply_basic(category)
    category == 'text' ? list.map { |file| weight = add(file['size'], category) if include_file_type(category, file) } :
    list.map { |file| weight = multiply(file['size'], category) if include_file_type(category, file) }

    weight.round(2)
  end

  def all_categories
    CATEGORIES.map { |key, value| key }
  end

  def total_basic_weight
    total_weight = 0
    all_categories.each { |category| total_weight += basic_weight(category) }
    total_weight.round(2)
  end

  def gravity_displacement
    (total_basic_weight - total_ideal_weight).round(2)
  end

  private

  def multiply(size, category)
    (size * gravity(category)) / MB
  end

  def add(size, category)
    calculate(size.to_f) + gravity(category)
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

  def total_ideal_weight
    ideal_weight = 0
    list.each { |file| ideal_weight += file['size'] }
    calculate(ideal_weight.to_f).round(2)
  end

  def calculate(number)
    number / MB
  end

end
