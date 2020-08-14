# frozen_string_literal: true

# Caesar Cipher class
class CaesarCipher
  def encrypt(message, shift)
    exit unless valid_chars?(message)
    chars = message.split ''
    chars.map { |char| get_shifted_code(char, shift).chr }.join
  end

  private

  def get_shifted_code(char, shift)
    char_code = char.ord
    min = get_min(char_code)
    position_from_min = char_code - min
    position_from_alphabet = (position_from_min + shift) % 26
    position_from_alphabet + min
  end

  def get_min(char_code)
    char_code >= 65 && char_code <= 90 ? 65 : 97
  end

  def valid_chars?(string)
    string.split('').all? do |char|
      valid = (char.ord >= 65 && char.ord <= 90) || (char.ord >= 97 && char.ord <= 122)
      puts "#{char} isn't in the alphabet" unless valid
      valid
    end
  end
end
