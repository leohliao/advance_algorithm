require_relative 'p05_hash_map'

# Create a HashMap to count up the number of letters
# If word is an even number length, then all leter's counters need to be
# an even number.
# If word is an odd number length, then all letter's counts
#need to be an even nuber except one of the entries

def can_string_be_palindrome?(string)

  (0...(string.length-1)).each do |i|
    (i+1...string.length).each do |j|
      word = string[i..j]
      return true if word == word.reverse
    end
  end
  false
end
