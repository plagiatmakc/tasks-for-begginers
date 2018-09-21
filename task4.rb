class Four
  attr_reader :hash

  def initialize
    @hash = { key1: {}, key2: {}, key3: { key4: 'str', key5: 'str2', key6: { key7: { key8: 1, key9: [2]} } }}
    find_in_hash_recurs(@hash,:key9)
  end

  def find_in_hash_recurs(hash, found_key)
    hash.each do |_key, val|
      if hash.has_key?(found_key)
      puts "Value of #{found_key} => #{hash[found_key]}"
        break
      elsif val.is_a?(Hash)
        find_in_hash_recurs(val, found_key)
      end
    end
  end
end
