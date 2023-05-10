# frozen_string_literal: true

require "nmax"
require "stringio"

RSpec.describe Nmax do
  before do
    $stdin = StringIO.new("joe123uuu77ff99")
    ARGV[0] = "2"
  end
  it "reads input from STDIN" do
    expect(Nmax.read_data).to eq("joe123uuu77ff99")
  end

  it "extracts numbers from a string" do
    expect(Nmax.extract_digits).to eq([123, 77, 99])
  end

  it "provides proper sorted produce_output" do
    expect(Nmax.produce_output).to eq([123, 99])
  end

  it "detects no input" do
    $stdin = StringIO.new("")
    expect(Nmax.produce_output).to eq("No input!")
  end

  it "detects no argument" do
    ARGV.clear
    expect(Nmax.produce_output).to eq("No argument!")
  end

  it "detects input with no digits" do
    $stdin = StringIO.new("ksjdbkabjfvkafgvkagk")
    expect(Nmax.produce_output).to eq("No digits in input!")
  end

  it "detects wrong type of argument" do
    ARGV[0] = "b"
    expect(Nmax.produce_output).to eq("Argument is not a number!")
  end

  after do
    $stdin = STDIN
  end
end
