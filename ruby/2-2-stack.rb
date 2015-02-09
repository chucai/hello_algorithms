require "rubygems"
require "rspec"
require "pry"
require "pry-nav"

class LoopString
  def self.loop?(input)
    a, s = input.split(''), []
    i, len, mid, nexted, top = 0, 0, 0, 0, 0

    len = a.size
    mid = len/2 - 1

    # 压栈
    i.upto(mid) do |index|
      top += 1
      s[top] = a[index]
    end

    nexted = len % 2 == 0 ? (mid + 1) : (mid + 2)

    # 出栈
    nexted.upto(len-1) do |index|
      break if a[index] != s[top]
      top -= 1
    end

    top == 0
  end
end



describe LoopString do
  context "[abcba]" do
    let(:input) { "abcba"  }
    it "should be a loop string" do
      expect(LoopString.loop?(input)).to be true
    end  
  end

  context "[abba]" do
    let(:input) { "abba"  }
    it "should be a loop string" do
      expect(LoopString.loop?(input)).to be true 
    end
  end

  context "{[y]}" do
    let(:input) { "{[y]}"  }
    it "should not be a loop string" do
      expect(LoopString.loop?(input)).to be false 
    end
  end

  context "[abcded]" do
    let(:input) { "abcded"  }
    it "should not be a loop string" do
      expect(LoopString.loop?(input)).to be false 
    end
  end
end
