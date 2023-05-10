# frozen_string_literal: true

module Nmax
  class Error < StandardError; end

  module_function

  def read_data
    # Этот метод читает входные данные из linux pipe
    $stdin.tty? ? "" : $stdin.read
  end

  def extract_digits
    # Этот метод извлекает числа из полученной последовательности.
    # Он возвращает массив чисел или сообщение об ошибке.
    extract = read_data
    extract.empty? ? "No input!" : extract.scan(/\d{1,1000}/).map(&:to_i)
  end

  def produce_output
    # Здесь результаты работы предыдущих методов проходят проверки на валидность.
    result = extract_digits
    if result == "No input!"
      result
    elsif ARGV[0].nil?
      "No argument!"
    elsif result.empty?
      "No digits in input!"
    elsif !Integer(ARGV[0], exception: false)
      "Argument is not a number!"
    else
      # Если все проверки пройдены, массив сортируется, и из него извлекаются n
      # самых больших чисел. Их количество задаётся в качестве аргумента командной 
      # строки.
      result.sort.last(ARGV[0].to_i).reverse
    end
  end

  p produce_output
end
