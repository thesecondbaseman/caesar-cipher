# frozen_string_literal: true

require './lib/caesar_cipher'

describe CaesarCipher do
  describe '#encrypt' do
    caesar_cipher = CaesarCipher.new
    it 'handles shift of 0' do
      expect(caesar_cipher.encrypt('hello', 0)).to eql('hello')
    end
    it 'handles small shifts' do
      expect(caesar_cipher.encrypt('hello', 3)).to eql('khoor')
    end
    it 'handles large shifts' do
      expect(caesar_cipher.encrypt('hello', 130)).to eql('hello')
    end
    it 'handles negative shifts' do
      expect(caesar_cipher.encrypt('hello', -1)).to eql('gdkkn')
    end
    it 'handles upper and lowercase together' do
      expect(caesar_cipher.encrypt('heLlo', -1)).to eql('gdKkn')
    end
    it 'handles chars that aren\'t in alphabet' do
      expect(caesar_cipher.encrypt('h|&.o', 3)).to eql(nil)
    end
  end
end
