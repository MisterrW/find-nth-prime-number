module Prime

  def self.prime_gen(arr_length)
    my_array = Array.new(arr_length, true)

    my_array.each_with_index do |x, y|
      if x == true
        for z in (2..(Math.sqrt(y)).to_i)
          if y % z == 0
            my_array[y] = false
          end
        end
      end

      if y%10000 == 0
        unless y % 20000 == 0
          puts "...working..."
        else
          puts "...on it..."
        end
      end
    end

    my_array[1] = false

    prime_array = []

    my_array.each_with_index do |x, y|
      if my_array[y] == true
        prime_array << y.to_i
      end
    end

    prime_array.push("last")

    return prime_array

  end

  def self.to_nth(n)

    if n == 0
      raise ArgumentError, "No zeroth prime"
    elsif n<10
      primes = self.prime_gen(20)
    elsif n<1000
      primes = self.prime_gen(50000)
    elsif n<10000
      primes = self.prime_gen(105000)
    elsif n<25000
      primes = self.prime_gen(300000)
    elsif n<50000
      primes = self.prime_gen(650000)
    else
      return "You've confused me there."
    end
    return "The #{n}th prime number is #{primes[n]}."

  end
  
end

module BookKeeping
  VERSION = 1
end

module User

  @number = 0

  def self.set_number(number)
    if 0 < number && number < 50001
      @number = number
      self.find_prime
    else
      puts "Let's try again."
      self.input
    end
  end

  def self.input()
    puts "Give me a number between 1 and 50000 and I will tell you the nth prime."
    number = gets.chomp.to_i
    self.set_number(number)
      
  end


  def self.find_prime
    puts Prime.to_nth(@number)
  end

end

User.input()






