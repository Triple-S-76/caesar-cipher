require './caesar-cipher'

describe 'Caesar-Cipher' do
  describe 'basic tests' do
    it 'turns a to b' do
      expect(caesar_cipher('a', 1)).to eql('b')
    end
    it 'turns a to z' do
      expect(caesar_cipher('a', 25)).to eql('z')
    end
    it 'turns "help" to "mjqu"' do
      expect(caesar_cipher('help', 5)).to eql('mjqu')
    end
    it 'turns "mjqu" to "help"' do
      expect(caesar_cipher('mjqu', -5)).to eql('help')
    end
  end
end
