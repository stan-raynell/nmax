# frozen_string_literal: true

module Nmax
  class Error < StandardError; end

  module_function

  def reader
    $stdin.tty? ? "" : $stdin.read
  end

  def extractor
    reader.scan(/\d{1,1000}/).map(&:to_i)
  end

  def argument
    ARGV[0]
  end

  def output
    extractor.sort.reverse.first(argument.to_i)
  end

  p output
end
