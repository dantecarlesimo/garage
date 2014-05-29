User.create([
    {name: "John Smith", email: "john@smith.com", password: "1234567890", password_confirmation: "1234567890", phone: "347-921-4269"},
    {name: "Noah Johnson", email: "noah@johnson.com", password: "1234567890", password_confirmation: "1234567890", phone: "415-222-9670"},
    {name: "Sophia Williams", email: "sophia@williams.com", password: "1234567890", password_confirmation: "1234567890", phone: "650-543-4800"},
    {name: "Liam Brown", email: "liam@brown.com", password: "1234567890", password_confirmation: "1234567890", phone: "650-253-0000"},
    {name: "Olivia Jones", email: "olivia@jones.com", password: "1234567890", password_confirmation: "1234567890", phone: "415-555-5555"},
  ])

Sale.create!([
    {user_id: 1, title: "Moving Sale", address: "123 Main St.", city: "Alameda", zipcode: 94501, date:"June 1, 2014", time_start: "7 am", time_end: "2 pm", description: "Moving out of state. Tons of great furniture!"},
  ])

Item.create!([
    {sale_id: 1, transaction_id: nil, name: "Sofa", description: "Brown leather, hardly used", price: 500},
])