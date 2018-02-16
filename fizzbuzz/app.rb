class FizzBuzz
  def self.print(range)
    range.each do |item|
      puts process item
    end
  end

  def self.process(item)
    return 'FizzBuzz' if item % 3 == 0 && item % 5 == 0
    return 'Fizz' if item % 3 == 0
    return 'Buzz' if item % 5 == 0
    item
  end
end


