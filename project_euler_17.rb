class NumberLetters
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def result
    convert(number)
  end

  def output
    puts convert(number)
  end

  private
  def convert(num)
    number_chars = num.to_s.chars.to_a
    if num < 10
      one_to_nine[num - 1]
    elsif num < 100 && num % 10 == 0
      decades[number_chars[0].to_i - 1]
    elsif num < 20
      eleven_to_nineteen[number_chars[1].to_i - 1]
    elsif num < 100
      "#{ decades[number_chars[0].to_i - 1] } #{ one_to_nine[number_chars[1].to_i - 1] }"
    elsif num < 1000 && num % 100 == 0
      "#{ one_to_nine[number_chars[0].to_i - 1] } hundred"
    elsif num < 1000
      "#{ one_to_nine[number_chars[0].to_i - 1] } hundred and #{ convert(number_chars[1..2].join.to_i) }"
    elsif num == 1000
      "one thousand"
    else
      ""
    end
  end

  def one_to_nine
    @one_to_nine ||= %w[one two three four five six seven eight nine]
  end

  def eleven_to_nineteen
    @eleven_to_nineteen ||= %w[eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
  end

  def decades
    @decades ||= %w[ten twenty thirty forty fifty sixty seventy eighty ninety]
  end
end

string = ""
(1..1000).each do |n|
  string << NumberLetters.new(n).result
end
puts string.gsub(' ', '').length
