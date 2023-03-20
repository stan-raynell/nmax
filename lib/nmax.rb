# frozen_string_literal: true

module Nmax
  class Error < StandardError; end

  module_function

  def reader
    # This method reads standard input from pipe
    $stdin.tty? ? "" : $stdin.read
  end

  def extractor
    # This method extracts integers from the obtained sequence.
    # It returns an array of integers or a warning message.
    extract = reader
    extract.empty? ? "No input!" : extract.scan(/\d{1,1000}/).map(&:to_i)
  end

  def output
    # Here the previous methods results are evaluated against validation checks
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
      # If all validations are passed the array gets sorted and n largest
      # digits are extracted. Their number is set as a command line argument.
      result.sort.last(ARGV[0].to_i).reverse
    end
  end

  p output
end
