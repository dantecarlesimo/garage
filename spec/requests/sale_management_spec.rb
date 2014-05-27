require 'spec_helper'

describe 'Sales Management' do
  subject { FactoryGirl.create(:user) }
  before do
    sign_in_as_a_valid_user
  end

  describe '/sales' do  
    before(:each) do
      @sale = Sale.create!(title: "Amazing Antiques This Saturday", address: "414 Brannan Street", city: "San Francisco", zipcode: "94114")
      @sale.items.create!([{ name: "Basketball", price: 5, description: "Partially deflated but signed by someone named M. Jordan", transaction_id: 1 }, { name: "Tennis Racket", price: 10, description: "mint condition" }])
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

  describe '/sales/:sale_id/items' do
    before(:each) do
      @sale2 = Sale.create!(title: "Incredible Deals", address: "414 Brannan Street", city: "San Francisco", zipcode: "94114")
      @sale2.items.create!([{name: "Gucci Handbag", price: 5, description: "Great condition"}, { name: "Prada Clutch", price: 10, description: "like new" }])
    end
    describe 'POST with JSON' do
      it 'should create a garage sale item' do

        post "/sales/#{@sale2.id}/items.json", :item => { name: "Rayban Sunglasses", description: "Pretty sure they're authentic.", price: 10 }
        @result = JSON.parse(response.body)

        @result["name"].should == "Rayban Sunglasses"
        @result["description"].should == "Pretty sure they're authentic."
        @result["price"].should == 10
      end

      it 'item should be associated with a garage sale' do
        post "/sales/#{@sale2.id}/items.json", :item => { name: "Rayban Sunglasses", description: "Pretty sure they're authentic.", price: 10 }
        @result = JSON.parse(response.body)

        Sale.all.where(title: "Incredible Deals")[0].items.where(name: "Rayban Sunglasses").should_not == nil
        @result["sale_id"].should == Sale.all.where(title: "Incredible Deals")[0].id
      end
    end
    describe 'DELETE with JSON' do
      it 'should delete an item from a sale' do
        delete "/sales/#{Sale.all.where(title: "Incredible Deals")[0].id}/items/#{Item.all.where(name: "Gucci Handbag")[0].id}.json"
        response.response_code.should == 204

        Item.all.where(name: "Gucci Hangbag")[0].should == nil
        Sale.all.where(title: "Incredible Deals")[0].items.length.should == 1         #@sale2.reload.items.length.should == 1 
      end
    end
  end
end