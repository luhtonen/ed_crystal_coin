require "./block"
require "./transaction"

class EdCrystalCoin::Blockchain
  getter chain
  getter uncommitted_transactions

  def initialize
    @chain = [ Block.first ]
    @uncommitted_transactions = [] of Block::Transaction
  end

  def add_transaction(transaction)
    @uncommitted_transaction << transaction
  end
end
