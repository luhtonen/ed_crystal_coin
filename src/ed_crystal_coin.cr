require "./ed_crystal_coin/*"

module EdCrystalCoin
  VERSION = "0.1.0"

  blockchain = [ EdCrystalCoin::Block.first ]
  puts blockchain.inspect
  previous_block = blockchain[0]

  5.times do |i|
    new_block = EdCrystalCoin::Block.next(previous_block: previous_block)
    blockchain << new_block
    previous_block = new_block
    puts new_block.inspect
  end

#  p blockchain
end
