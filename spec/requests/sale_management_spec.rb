require 'spec_helper'

describe 'Sales Management' do
  subject { FactoryGirl.create(:user) }
  before do
    sign_in_as_a_valid_user
  end

  describe '/sales' do  
    before(:each) do
      @sale = Sale.create!(title: "Amazing Antiques This Saturday", address: "414 Brannan Street", city: "San Francisco", zipcode: "94114")
      @sale.items.create!([{name: "Basketball", price: 5, description: "Partially deflated but signed by someone named M. Jordan", transaction_id: 1}, {name: "Tennis Racket", price: 10, description: "mint condition"}])
    end

    describe 'GET with JSON' do
      before(:each) do
        get '/sales.json'
        @result = JSON.parse(response.body)
      end

      it 'returns a list of all garage sales' do
        @result["sales"].should_not == nil
        @result["sales"].length.should == 1

        sale = @result["sales"][0]
        sale["title"].should == @sale.title
        sale["address"].should == @sale.address
        sale["city"].should == @sale.city
        sale["zipcode"].should == @sale.zipcode

        sale["items"].should_not == nil
      end

      it 'returns a list of all of the items of a particular sale' do
        items = @result["sales"][0]["items"]
        items.should_not == nil
        items.length.should == @sale.items.length
        items[0]["name"].should == @sale.items[0].name
        items[0]["price"].should == @sale.items[0].price
      end

      xit 'does not return items that have been sold' do
        @result["sales"].each do |sale|
          sale["items"].each do |item|
            item["transaction_id"].should == nil
          end
        end
      end
    end

    describe 'POST with JSON' do
      before(:each) do
        post '/sales.json', :sale => { title: "Amazing Garage Sale!", address: "414 Brannan Street", city: "San Francisco", zipcode: "94107"}
        @result = JSON.parse(response.body)
      end

      it 'should create a new garage sale' do
        response.response_code.should == 201

        @result["title"].should == "Amazing Garage Sale!"
        @result["address"].should == "414 Brannan Street"
        @result["city"].should == "San Francisco"
        @result["zipcode"].should == 94107
      end
    end

    describe 'DELETE with JSON' do
      before(:each) do
        delete "/sales/#{Sale.all.where(title: "Amazing Antiques This Saturday")[0].id}.json"
      end

      it 'should delete a garage sale' do
        response.response_code.should == 204

        Sale.all.where(title: "Amazing Antiques This Saturday")[0].should == nil
      end
    end
  end
end