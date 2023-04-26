require "json"

class EdCrystalCoin::Block::Transaction
  include JSON::Serializable

  getter from : String
  getter to : String
  getter amount : Int64

  def initialize(@from, @to, @amount); end
end
