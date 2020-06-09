def encrypt message, shift
  chars = message.split ''
  shifted_chars = chars.map do |char|
    shifted_char_code = get_shifted_code(char, shift)
    shifted_char_code.chr
  end
  shifted_chars.join
end

def get_shifted_code char, shift
  char_code = char.ord

  case
  when char_code >= 65 && char_code <= 90
    min = 65
    position_from_min = char_code - min
    position_from_alphabet = (position_from_min + shift) % 26
    char_code = position_from_alphabet + min 
  when char_code >= 97 && char_code <= 122
    min = 97
    position_from_min = char_code - min
    position_from_alphabet = (position_from_min + shift) % 26
    char_code = position_from_alphabet + min
  end
  char_code
end

print "Enter your message to be encrypted or \"/stop/\" to stop: "
message = gets.chomp

until message == "/stop/" do
  print "enter shift: "
  shift = gets.chomp
  next if shift.to_i == 0 

  shift = shift.to_i
  puts "Encrypted: #{encrypt message, shift}"

  print "Enter your message to be encrypted or \"/stop/\" to stop: "
  message = gets.chomp
end