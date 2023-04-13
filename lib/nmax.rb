# frozen_string_literal: true

module Nmax
  class Error < StandardError; end

  module_function

  def reader
    # Этот метод читает входные данные из linux pipe
    $stdin.tty? ? "" : $stdin.read
  end

  def extractor
    # Этот метод извлекает числа из полученной последовательности.
    # Он возвращает массив чисел или сообщение об ошибке.
    extract = reader
    extract.empty? ? "No input!" : extract.scan(/\d{1,1000}/).map(&:to_i)
  end

  def output
    # Здесь результаты работы предыдущих методов проходят проверки на валидность.
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
      # Если все проверки пройдены, массив сортируется и из него извлекаются n
      # самых больших чисел. Их количество задаётся в качестве аргумента командной 
      # строки.
      result.sort.last(ARGV[0].to_i).reverse
    end
  end

  p output
end
