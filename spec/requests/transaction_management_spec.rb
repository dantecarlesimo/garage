require 'spec_helper'

describe 'Transactions Management' do
  subject { FactoryGirl.create(:user) }
  before do
    @user = FactoryGirl.create(:user)
    sign_in_as_a_valid_user
  end

  describe 'a new transaction' do
    before(:each) do
      @seller = User.create(name: "John Smith", email: "john@smith.com", password: "1234567890", password_confirmation: "1234567890")
      @sale = @seller.sales.create!(title: "Classic Arcade Games", address: "414 Brannan Street", city: "San Francisco", zipcode: "94114")
      @sale.items.create!([{ name: "1942", price: 500, description: "Great condition but buttons are sticking" }, { name: "Tempest", price: 1000, description: "Best game of all time" }])
      
      post "/sales/#{Sale.all.where(title: "Classic Arcade Games")[0].id}/items/#{Item.all.where(name: "1942")[0].id}"
      
      @transaction = Transaction.all.where(item_id: Sale.all.where(title: "Classic Arcade Games")[0].items.where(name: "1942")[0].id)[0]
      end

    it 'can be created' do
      response.status.should == 302
     
      @transaction.should_not == nil
      @transaction.user_id.should == @user.id
      @transaction.seller_id.should == @seller.id
      @transaction.user_id.should_not == @transaction.seller_id
      @transaction.item_id.should == Item.all.where(name: "1942")[0].id
    end

    it 'is associated with an item' do
      response.status.should == 302
      
      Item.all.where(name: "1942")[0].transaction_id.should_not == nil
      @transaction.id.should == Item.all.where(name: "1942")[0].transaction_id
    end

    xit 'removes item from sale index' do
      post "/sales/#{Sale.all.where(title: "Classic Arcade Games")[0].id}/items/#{Item.all.where(name: "Tempest")[0].id}"

      response.status.should == 302
      follow_redirect!

      response.body.should_not include("Tempest")
    end
  end
end