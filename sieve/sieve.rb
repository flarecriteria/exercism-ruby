##
# Implementation of the Sieve of Eratosthenes
#
# Why would you makes this an instancialized class?
class Sieve
  def initialize(up_to_num)
    @up_to_num = up_to_num
  end

  # Everytime I go to optimize this it's no longer the sieve
  #
  def primes
    arr = Array.new(@up_to_num)
    (2..@up_to_num).each do |num|
      next unless arr[num].nil?
      arr[num] = true
      prime = num
      while (num += prime) <= @up_to_num
        arr[num].nil? && arr[num] = false
      end
    end
    arr.size.times.select { |i| arr[i] }
  end
end
