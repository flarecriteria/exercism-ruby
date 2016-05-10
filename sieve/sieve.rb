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
  def primes # rubocop:disable Metrics/MethodLength
    arr = [false, false]
    (2..@up_to_num).each do |num|
      next unless arr[num].nil?
      arr[num] = true
      prime = num
      while num < @up_to_num
        num += 1
        next unless arr[num].nil? && (num % prime == 0)
        arr[num] = false
      end
    end
    arr.size.times.select { |i| arr[i] }
  end
end
