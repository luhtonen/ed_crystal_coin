require "./proof_of_work"

class EdCrystalCoin::Block
  include ProofOfWork

  getter current_hash : String
  getter index : Int32
  getter nonce : Int32
  getter previous_hash : String

  def initialize(index = 0, transactions = [] of Transaction, previous_hash = "hash")
    @transactions = transactions
    @index = index
    @timestamp = Time.utc
    @previous_hash = previous_hash
    @nonce = proof_of_work
    @current_hash = calc_hash_with_nonce(@nonce)
  end

  def self.first()
    Block.new(previous_hash: "0")
  end

  def self.next(previous_block, transactions = [] of Transaction)
    Block.new(
      transactions: transactions,
      index: previous_block.index + 1,
      previous_hash: previous_block.current_hash
    )
  end
end
