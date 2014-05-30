require 'spec_helper'

describe 'Pages Management' do
  subject { FactoryGirl.create(:user) }
  before do
    @user = FactoryGirl.create(:user)
    sign_in_as_a_valid_user
  end

  describe '/dashboard' do  
    before(:each) do
      @sale = Sale.create!(user_id: 1, title: "Amazing Antiques This Saturday", address: "414 Brannan Street", city: "San Francisco", zipcode: "94114")
      @sale.items.create!([{id:1, name: "Basketball", price: 5, description: "Partially deflated but signed by someone named M. Jordan", transaction_id: 1 }, { name: "Tennis Racket", price: 10, description: "mint condition" }])
      @transaction = Transaction.create(id:1, user_id: 1, seller_id: 1, item_id: 1)
    end

    it 'shows a list of the users sales' do
      get '/my_sales'
      response.status.should == 200
      response.should render_template :user_sales
      response.body.should include("Amazing Antiques This Saturday")
    end

    it 'shows a list of the users items' do
      get '/my_items'
      response.status.should == 200
      response.should render_template :user_items
      response.body.should include("Basketball")
      response.body.should include("mint condition")
    end

    it 'shows a list of the users transactions' do
      get '/my_transactions'
      response.status.should == 200
      response.should render_template :user_transactions
      response.body.should include("Basketball")
    end
  end
end













