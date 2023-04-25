require "uuid"
require "kemal"
require "json"
require "./ed_crystal_coin"

# Generate a globally unique address for this node
node_identifier = UUID.random.to_s

# Create Blockchain
blockchain = EdCrystalCoin::Blockchain.new

get "/chain" do
  "Send the blockchain as json objects"
end

get "/mine" do
  "We'll mine a new Block"
end

get "/pending" do
  { transactions: "#{blockchain.uncommitted_transactions}" }.to_json
end

post "/transactions/new" do |env|
  transaction = EdCrystalCoin::Block::Transaction.new(
    from: env.params.json["from"].as(String),
    to: env.params.json["to"].as(String),
    amount: env.params.json["amount"].as(Int64)
  )

  blockchain.add_transaction(transaction)
  puts transaction

  "Transaction #{transaction} has been added to the node"
end

Kemal.run
