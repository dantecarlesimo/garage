require 'spec_helper'

describe Transaction do
  before :each do
    @user = User.create(name: "John Smith", email: "john@smith.com", password: "1234567890", password_confirmation: "1234567890")
    @user2 = User.create(name: "Jane Smith", email: "jane@smith.com", password: "1234567890", password_confirmation: "1234567890")
    @sale = @user.sales.create(title: "Moving Sale", address: "123 Main Street", city: "Alameda", zipcode: 94501)
    @item = @sale.items.create(name: "Sofa", description: "Brown leather, hardly used", price: 500)
    @transaction = Transaction.create(user_id: @user.id, seller_id: @user2.id, item_id: @item.id)
  end
  
  it 'it works' do
    subject.should respond_to(:user_id)
    subject.should respond_to(:seller_id)
    subject.should respond_to(:item_id)
  end

  it 'should have a user_id, seller_id, and item_id' do
    @transaction.user_id.should == @user.id
    @transaction.seller_id.should == @user2.id
    @transaction.item_id.should == @item.id
  end

  it 'buyer and seller should not be the same user' do
    @transaction.user_id.should_not == @transaction.seller_id
  end

end