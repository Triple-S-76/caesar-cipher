
message_to_encrypt = "What a string!"
message_shift = 31

if (message_shift < -26 || message_shift > 26) # Fix shift number if it's too high or too low
  message_shift = message_shift % 26
end

message_shift_reverse = message_shift * -1 # Get reverse of shift number

def caesar_cipher(string, shift)

  letters = ("a".."z").to_a
  split = string.split("")
  new_string = ""

  split.each do |char|
    if (letters.index(char.downcase) == nil) # If it's not a letter
      new_string += char
    elsif (char.upcase == char)
      index = letters.index(char.downcase) # If it's upper case
      index += shift
      index = index - 26 if index > 25
      index = index + 26 if index < 0
      new_string += letters[index].upcase
    else
      index = letters.index(char) # If it's lower case
      index += shift
      index = index - 26 if index > 25
      index = index + 26 if index < 0
      new_string += letters[index]
    end
  end
  new_string
end

message_encrypted = caesar_cipher(message_to_encrypt, message_shift)
caesar_cipher(message_encrypted, message_shift_reverse)
