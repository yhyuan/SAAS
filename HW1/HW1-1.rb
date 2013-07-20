def palindrome?(string)
    letters = string.downcase.scan(/\w/)
    return letters == letters.reverse
end
 
puts palindrome?("A man, a plan, a canal -- Panama")  # => true
puts palindrome?("Madam, I'm Adam!")                  # => true
puts palindrome?("Abracadabra")                       # => false (nil is also ok)
 
def count_words(string)
    words = string.downcase.split(/[^a-zA-Z]/).reject{|e| e.empty?}
    wf = Hash.new(0)
    words.each { |word| wf[word] += 1 }
    return wf
end
puts count_words("A man, a plan, a canal -- Panama")
    # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
puts count_words "Doo bee doo bee doo"
    # => {'doo' => 3, 'bee' => 2}
