require "openssl"

class EdCrystalCoin::Block
  property current_hash : String
  getter index : Int64

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

  def self.next(previous_block, data = "Transaction Data")
    Block.new(
      data: "Transaction data number (#{previous_block.index + 1})",
      index: previous_block.index + 1,
      previous_hash: previous_block.current_hash
    )
  end

  private def hash_block
    hash = OpenSSL::Digest.new("SHA256")
    hash.update("#{@index}#{@timestamp}#{@data}#{@previous_hash}")
    hash.hexfinal
  end
end
