class EdCrystalCoin::Block::Transaction
  getter from : String
  getter to : String
  getter amount : Int64

  def initialize(@from, @to, @amount); end
end
