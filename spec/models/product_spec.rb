require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with description, price and category' do
  	product = create(:product)
  	expect(product).to be_valid
  end

  context 'validates' do
	  it { should validate_presence_of(:description) }
	  it { should validate_presence_of(:price) }
	  it { should validate_presence_of(:category) }
	end

	context 'associations' do
		it { should belong_to(:category) }
	end

	context 'instance methods' do
	  it 'should return a product with a full description' do
	  	product = create(:product)
	  	expect(product.full_description).to eq("#{product.description} - #{product.price}")
	  end
	end
end
