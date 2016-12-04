require "rails_helper"

describe Product do
  it 'is valid' do
  	product = Product.create(:name => "product1", :description => "A must have product", :price => 600)
    expect(product).to be_valid
  end

  it 'is invalid without price' do
  	product = Product.create(:name => "product1", :description => "A must have product")
    expect(product).to_not be_valid
  end

   it 'is invalid without name' do
  	product = Product.create(:description => "A must have product", :price => 600)
    expect(product).to_not be_valid
  end

   it 'is invalid without description' do
  	product = Product.create(:name => "product1", :price => 600)
    expect(product).to_not be_valid
  end

   it 'is invalid if price is not a number' do
  	product = Product.create(:name => "product1", :description => "A must have product", :price => "abc")
    expect(product).to_not be_valid
  end
end