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
  def primes # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    arr = Array.new(@up_to_num + 1)
    arr[2] = true unless @up_to_num < 2
    (3..@up_to_num).step(2).each do |num|
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
