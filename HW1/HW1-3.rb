def combine_anagrams(words)
    hash = Hash.new()
    words.each do |word|
        sorted_word = word.downcase.split('').sort.join
        if hash.has_key?(sorted_word)
            hash.store(sorted_word, hash.fetch(sorted_word).push(word))
        else
            hash.store(sorted_word, Array.new(1,word))
        end
    end
    return hash.values
end

print combine_anagrams(['a', 'A']) 
print combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])
 