require 'spec_helper'


describe Item do
    before :each do #instantiates a new item before each test
    @item = Item.create(sale_id: 1, transaction_id: nil, name: "Sofa", description: "Brown leather, hardly used", price: 500)
  end

  it 'should respond to name and price' do
    subject.should respond_to(:name)
    subject.should respond_to(:price)
  end

  it 'should have a name' do
    item = Item.create(sale_id: 1, transaction_id: nil, name: "", description: "Brown leather, hardly used", price: 500)
    item.should_not be_valid
  end

  it 'should have a price' do
    item = Item.create(sale_id: 1, transaction_id: nil, name: "Sofa", description: "Brown leather, hardly used", price: nil)
    item.should_not be_valid
  end

end