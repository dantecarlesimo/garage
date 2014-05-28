User.create([
    {name: "John Smith", email: "john@smith.com", password: "1234567890", password_confirmation: "1234567890", phone: "347-921-4269"},
    {name: "Noah Johnson", email: "noah@johnson.com", password: "1234567890", password_confirmation: "1234567890", phone: "415-222-9670"},
    {name: "Sophia Williams", email: "sophia@williams.com", password: "1234567890", password_confirmation: "1234567890", phone: "650-543-4800"},
    {name: "Liam Brown", email: "liam@brown.com", password: "1234567890", password_confirmation: "1234567890", phone: "650-253-0000"},
    {name: "Olivia Jones", email: "olivia@jones.com", password: "1234567890", password_confirmation: "1234567890", phone: "415-555-5555"},
  ])

Sale.create([
    {user_id: 1, title: "Moving Sale", address: "123 Main St.", city: "Alameda", zipcode: 94501, date:"June 1, 2014", time_start: "7 am", time_end: "2 pm", description: "Moving out of state. Tons of great furniture!"},
    {user_id: 2, title: "Estate Sale", address: "456 State St.", city: "Daly City", zipcode: 94014, date:"June 15, 2014", time_start: "8 am", time_end: "4 pm", description: "Everything must go! Cheap prices"},
    {user_id: 3, title: "Antiques", address: "789 Church St.", city: "San Francisco", zipcode: 94114, date:"June 9, 2014", time_start: "7 am", time_end: "6 pm", description: "Great antiques and collectables"},
  ])

Item.create([
    {sale_id: 1, transaction_id: nil, name: "Sofa", description: "Brown leather, hardly used", price: 500},
    {sale_id: 1, transaction_id: nil, name: "Queen Bed", description: "Wood frame, looks great", price: 350},
    {sale_id: 2, transaction_id: nil, name: "Lamp", description: "Ugly brass lamp that works great", price: 50},
    {sale_id: 3, transaction_id: nil, name: "Cabinet", description: "Antique mahogany cabinet with glass doors", price: 1000},
    {sale_id: 3, transaction_id: nil, name: "Bar Table", description: "1950s bar table with glass rack and liquor storage", price: 250}
  ])

Transaction.create([
    {user_id: 4, seller_id: 1, item_id: 2},
    {user_id: 5, seller_id: 2, item_id: 2},
    {user_id: 5, seller_id: 3, item_id: 5}
  ])