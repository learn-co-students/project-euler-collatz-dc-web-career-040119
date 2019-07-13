require 'pry'

def even_next(n)
  n/2
end

def odd_next(n)
  (3 * n) + 1
end

def next_value(n)
  n.even? ? even_next(n) : odd_next(n)
end

def collatz(n)
  collatz_arr = []
  while n > 1
    collatz_arr << n
    n = next_value(n)
  end
  collatz_arr << n
  collatz_arr
end

def longest_collatz
  n = 1000000
  longest = 0
  longest_length = 0
  processed_nums = {}
  while n > 1
    unless !!processed_nums[n]
      collatz_arr = collatz(n)
      collatz_arr.each{ |v| processed_nums[v] = v }
      if collatz_arr.length > longest_length
        longest = n
        longest_length = collatz_arr.length
      end
    end
    n -= 1
  end
  longest
end