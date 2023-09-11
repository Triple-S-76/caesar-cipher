require './caesar-cipher-2'

describe CaesarCipher do
  subject(:translator) { described_class.new('message123', 2, true) }

  context 'testing instance variables' do
    it 'tests array of upper letters' do
      expected_array_of_upper_letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
      expect(subject.alphabet_upcase).to eq(expected_array_of_upper_letters)
    end

    it 'tests array of lower letters' do
      expected_array_of_lower_letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
      expect(subject.alphabet_downcase).to eq(expected_array_of_lower_letters)
    end
  end

  context 'checks the #fix_shift' do
    it 'checks the #fix_shift method with 50' do
      expect(subject.fix_shift(50)).to eq(24)
    end

    it 'checks the #fix_shift with 5' do
      expect(subject.fix_shift(5)).to eq(5)
    end

    it 'checks the #fix_shift with 100_005' do
      expect(subject.fix_shift(100_005)).to eq(9)
    end

    it 'checks the #fix_shift with -10' do
      expect(subject.fix_shift(-10)).to eq(16)
    end
  end

  context 'checks #convert_char' do
    it 'checks #convert_char with a lower case letter' do
      letter = 'a'
      shift = 4
      alphabet = ('a'..'z').to_a
      expect(subject.convert_char(letter, shift, alphabet)).to eq('e')
    end

    it 'checks #convert_char with an upper case letter' do
      letter = 'C'
      shift = 5
      alphabet = ('A'..'Z').to_a
      expect(subject.convert_char(letter, shift, alphabet)).to eq('H')
    end

    it 'checks #convert_case with a negative number' do
      letter = 'S'
      shift = -24
      alphabet = ('A'..'Z').to_a
      expect(subject.convert_char(letter, shift, alphabet)).to eq('U')
    end

    it 'checks #convert_case with a large number' do
      letter = 'F'
      shift = 259
      alphabet = ('A'..'Z').to_a
      expect(subject.convert_char(letter, shift, alphabet)).to eq('E')
    end

    it 'checks the number of calls to #convert_char with 6 lower case letters' do
      allow(subject).to receive(:convert_char).and_return('e', 'f', 'g', 'h', 'i', 'j')
      expect(subject).to receive(:convert_char).exactly(6).times
      expect(subject.convert_word('abcdef', 4)).to eq('efghij')
    end
  
    it 'checks the number of calls to #convert_char with 6 upper case letters' do
      allow(subject).to receive(:convert_char).and_return('C', 'D', 'E', 'F', 'G')
      expect(subject).to receive(:convert_char).exactly(5).times
      expect(subject.convert_word('ABCDE', 2)).to eq('CDEFG')
    end
  end
end
