require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    context 'create new product' do
      it 'saved successfully' do
        @category = Category.create(:name => "Flowers")
        @product = Product.create(
            :name => "Peony", 
            :price_cents => 10, 
            :quantity => 50, 
            :category => @category
          )
        expect(@product).to be_valid
      end

      it "raises an error if it can't validate name is present" do
        @category = Category.create(:name => "Flowers")
        @product = Product.create(
            :name => nil, 
            :price_cents => 10, 
            :quantity => 50, 
            :category => @category
          )
        expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
      end

      it "raises an error if it can't validate price_cents is present" do
        @category = Category.create(:name => "Flowers")
        @product = Product.create(
            :name => 'Peony', 
            :price_cents => nil, 
            :quantity => 50, 
            :category => @category
          )
        expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
      end

      it "raises an error if it can't validate quantity is present" do
        @category = Category.create(:name => "Flowers")
        @product = Product.create(
            :name => 'Peony', 
            :price_cents => 10, 
            :quantity => nil, 
            :category => @category
          )
        expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
      end

      it "raises an error if it can't validate category is present" do
        @product = Product.create(
            :name => 'Peony', 
            :price_cents => 10, 
            :quantity => 50, 
            :category => nil
          )
        expect(@product.errors.full_messages[0]).to eq("Category must exist")
      end
    end
  end

end
