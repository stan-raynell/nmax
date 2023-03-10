# frozen_string_literal: true

module Nmax
  class Error < StandardError; end

  module_function

  def reader
    # Чтение данных из стандартного ввода
    $stdin.tty? ? "" : $stdin.read
  end

  def extractor
    # Поиск чисел в прочтённых данных
    extract = reader
    extract.empty? ? "No input!" : extract.scan(/\d{1,1000}/).map(&:to_i)
  end

  def output
    # Проверка результата поиска и выдача
    result = extractor
    if result == "No input!"
      result
    elsif ARGV[0].nil?
      "No argument!"
    elsif result.empty?
      "No digits in input!"
    elsif !Integer(ARGV[0], exception: false)
      "Argument is not a number!"
    else
      result.sort.last(ARGV[0].to_i).reverse
    end
  end

  p output
end
