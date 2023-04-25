require "uuid"
require "kemal"
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
  "Send pending transactions as json objects"
end

post "/transactions/new" do
  "We'll add a new transaction"
end

Kemal.run
