message_to_encrypt = 'Convert this message using a caesar cipher!'
message_shift = 1

def fix_shift(shift)
  shift % 26
end

def convert_char(letter, shift, array)
  letter_index = array.index(letter)
  shift = letter_index + shift
  shift = fix_shift(shift) if shift < 1 || shift > 25
  array[shift]
end

def convert_word(message, shift)
  alphabet_upcase = ('A'..'Z').to_a
  alphabet_downcase = ('a'..'z').to_a
  message_split = message.split('')
  message_encrypted = ''
  message_split.each_with_index do |letter, index|
    if alphabet_upcase.include?(letter)
      message_encrypted << convert_char(letter, shift, alphabet_upcase)
    elsif alphabet_downcase.include?(letter)
      message_encrypted << convert_char(letter, shift, alphabet_downcase)
    else
      message_encrypted << letter
    end
  end
  message_encrypted
end

def caesar_cipher(message, shift, encrypt = true)
  shift = fix_shift(shift) if shift < 1 || shift > 25
  shift *= -1 if encrypt != true
  convert_word(message, shift)
end

p message_to_encrypt
message_encrypted = caesar_cipher(message_to_encrypt, message_shift)
p message_encrypted
message_unencrypted = caesar_cipher(message_encrypted, message_shift, false)
p message_unencrypted