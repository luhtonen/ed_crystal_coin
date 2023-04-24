require "openssl"

class EdCrystalCoin::Block
  def initialize(data : String)
    @data = data
  end

  def hash
    hash = OpenSSL::Digest.new("SHA256")
    hash.update(@data)
    hash.hexfinal
  end
end

puts EdCrystalCoin::Block.new("Hello, Cryptos!").hash
