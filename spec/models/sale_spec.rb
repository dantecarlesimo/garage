require 'spec_helper'


describe Sale do
    before :each do #instantiates a new sale before each test
    @sale = Sale.create(user_id: 1, title: "Moving Sale", address: "123 Main St.", city: "Alameda", zipcode: 94501, date:"June 1, 2014", time_start: "7 am", time_end: "2 pm", description: "Moving out of state. Tons of great furniture!")
  end

  it 'should respond to title and address' do
    subject.should respond_to(:title)
    subject.should respond_to(:address)
  end

  it 'should have a title' do
    sale = Sale.create(user_id: 1, title:"" , address: "123 Main St.", city: "Alameda", zipcode: 94501, date:"June 1, 2014", time_start: "7 am", time_end: "2 pm", description: "Moving out of state. Tons of great furniture!")
    sale.should_not be_valid
  end

  it 'should have a zipcode' do
    sale = Sale.create(user_id: 1, title: "Moving Sale" , address: "123 Main St.", city: "Alameda", zipcode: nil, date:"June 1, 2014", time_start: "7 am", time_end: "2 pm", description: "Moving out of state. Tons of great furniture!")
    sale.should_not be_valid
  end

end