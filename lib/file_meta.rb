#require_relative 'helper'

class FileMeta

  #include Helper

  attr_accessor :list, :weight

  CATEGORIES = YAML::load_file('config/categories.yml')
  MB = 1000000

  def initialize(list)
    @list = list
  end

  def count(category)
    list.select {|file| include_file_type(category, file)}.count
  end

  def basic_weight(category)
    weight = 0
    # could use reduce but have to figure out how to. Will probably have to refactor a few methods
    #list.map { |file| weight = add(file['size'], category)
    category == 'text' ? list.map { |file| weight = add(file['size'], category) if include_file_type(category, file) } :
    list.map { |file| weight = multiply(file['size'], category) if include_file_type(category, file) }

    weight.round(2)
  end

  def all_categories
    CATEGORIES.map { |key, value| key }
  end

  def total_basic_weight
    (all_categories.map { |category| basic_weight(category) }.reduce(:+)).round(2)
  end

  def gravity_displacement
    (total_basic_weight - total_ideal_weight).round(2)
  end

  private

  #def add_basic(category)
    #add(file['size'], category).reduce(0, &:+)
  #end

  def multiply(size, category)
    (size * gravity(category)) / MB
  end

  def add(size, category)
    calculate(size) + gravity(category)
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
    calculate(list.map { |file| file['size'] }.reduce(:+)).round(2)
  end

  def calculate(number)
    number.to_f / MB
  end

end
