require "rspec"

class HelloQueue
  attr_accessor :data, :head, :tail

  def initialize(data, head, tail)
    @data, @head, @tail = data, head, tail
  end

  def decode
    result = []
    @data.unshift(0)
    while @head < @tail
      result << @data[@head] 
      @head += 1
      @data[@tail] = @data[@head]
      @tail += 1
      @head += 1
    end
    result.join
  end
end

class Decode
  def self.decode(str)
    q = str.split('').map(&:to_i)
    HelloQueue.new(q, 1, 10).decode
  end
end

describe Decode do
  it "should decode a string" do
    encrypt_str = "631758924"
    expect_strk = "615947283"
    expect(Decode.decode(encrypt_str)).to eql(expect_strk)
  end
end

