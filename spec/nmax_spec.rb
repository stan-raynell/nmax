# frozen_string_literal: true

require "nmax"
require "stringio"

RSpec.describe Nmax do
  before do
    $stdin = StringIO.new("joe123uuu77ff99")
    ARGV << "2"
  end
  it "receives input from STDIN" do
    expect(Nmax.reader).to eq("joe123uuu77ff99")
  end

  it "extracts numbers from a string" do
    expect(Nmax.extractor).to eq([123, 77, 99])
  end

  it "gets a command line argument" do
    expect(Nmax.argument).to eq("2")
  end

  it "provides 2 sorted numbers" do
    expect(Nmax.output).to eq([123, 99])
  end

  after do
    $stdin = STDIN
  end
end
