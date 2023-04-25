require "openssl"

class EdCrystalCoin::Block
  property current_hash : String

  def initialize(index = 0, data = "data", previous_hash = "hash")
    @data = data
    @index = index
    @timestamp = Time.utc
    @previous_hash = previous_hash
    @current_hash = hash_block
  end

  def self.first(data="Genesis Block")
    Block.new(data: data, previous_hash: "0")
  end

  private def hash_block
    hash = OpenSSL::Digest.new("SHA256")
    hash.update("#{@index}#{@timestamp}#{@data}#{@previous_hash}")
    hash.hexfinal
  end
end

p EdCrystalCoin::Block.first
puts EdCrystalCoin::Block.new(data: "Same Data").current_hash
