
class CaesarCipher
  attr_accessor :alphabet_upcase, :alphabet_downcase, :message, :shift, :encrypt, :message_encrypted

  def initialize(message, shift, encrypt)
    @alphabet_downcase = ('a'..'z').to_a
    @alphabet_upcase = ('A'..'Z').to_a
    @message = message
    @shift = shift
    @encrypt = encrypt
    cipher(message, shift, encrypt)
  end

  def cipher(message, shift, encrypt)
    shift = fix_shift(shift)
    shift *= -1 unless encrypt
    convert_word(message, shift)
  end

  def fix_shift(shift)
    shift % 26
  end

  def convert_char(letter, shift, alphabet)
    letter_index = alphabet.index(letter)
    shift = letter_index + shift
    shift = fix_shift(shift) if shift < 1 || shift > 25
    alphabet[shift]
  end

  def convert_word(message, shift)
    message_split = message.split('')
    message_encrypted = ''
    message_split.each do |letter|
      if @alphabet_upcase.include?(letter)
        message_encrypted << convert_char(letter, shift, @alphabet_upcase)
      elsif @alphabet_downcase.include?(letter)
        message_encrypted << convert_char(letter, shift, @alphabet_downcase)
      else
        message_encrypted << letter
      end
    end
    @message_encrypted = message_encrypted
  end
end

3.times { puts }

my_cipher1_message = 'Encrypt this message!'
my_cipher1_shift = 1
my_cipher1_encrypt = true
my_cipher1_a = CaesarCipher.new(my_cipher1_message, my_cipher1_shift, my_cipher1_encrypt)
p "#{my_cipher1_message} - Original"
my_cipher1_a_encrypted = my_cipher1_a.message_encrypted
p "#{my_cipher1_a_encrypted} - Encrypted"

my_cipher1_b = CaesarCipher.new(my_cipher1_a_encrypted, my_cipher1_shift, false)
my_cipher1_b_decrypted =  my_cipher1_b.message_encrypted
p "#{my_cipher1_b_decrypted} - Decrypted"

3.times { puts }

my_cipher2_message = 'Convert this message using a caesar cipher!'
my_cipher2_shift = 5
my_cipher2_encrypt = true
my_cipher2_a = CaesarCipher.new(my_cipher2_message, my_cipher2_shift, my_cipher2_encrypt)
p "#{my_cipher2_message} - Original"
my_cipher2_a_encrypted = my_cipher2_a.message_encrypted
p "#{my_cipher2_a_encrypted} - Encrypted"

my_cipher2_b = CaesarCipher.new(my_cipher2_a_encrypted, my_cipher2_shift, false)
my_cipher2_b_decrypted =  my_cipher2_b.message_encrypted
p "#{my_cipher2_b_decrypted} - Decrypted"

3.times { puts }
