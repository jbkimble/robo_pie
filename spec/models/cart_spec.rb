require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "has initial contents" do
    cart = Cart.new({ "1" => 1 })

    expect(cart.contents).to eq({ "1" => 1 })
  end

  it "can add an item" do
    cart = Cart.new( { "1" => 1 } )

    cart.add_item(1)
    cart.add_item(2)

    expect(cart.contents).to eq({ "1" => 2, "2" => 1 })
  end

  it "returns total number of items in cart" do
    cart = Cart.new( { "1" => 2, "2" => 7, "3" => 6 } )

    expect(cart.total).to eq(15)
  end

  it "returns total number of a specific item" do
    cart = Cart.new( { "1" => 2, "2" => 7, "3" => 6 } )

    expect(cart.count_of(2)).to eq(7)
  end
end
