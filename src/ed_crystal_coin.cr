require "./ed_crystal_coin/*"

module EdCrystalCoin
  VERSION = "0.1.0"

  blockchain = [ EdCrystalCoin::Block.first ]
  previous_block = blockchain[0]

  5.times do
    new_block = EdCrystalCoin::Block.next(previous_block: previous_block)
    blockchain << new_block
    previous_block = new_block
  end

#  p blockchain
end
