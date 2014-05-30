User.create([
    {name: "John Smith", email: "john@smith.com", password: "1234567890", password_confirmation: "1234567890", phone: "347-921-4269"},
    {name: "Noah Johnson", email: "noah@johnson.com", password: "1234567890", password_confirmation: "1234567890", phone: "415-222-9670"},
    {name: "Sophia Williams", email: "sophia@williams.com", password: "1234567890", password_confirmation: "1234567890", phone: "650-543-4800"},
    {name: "Liam Brown", email: "liam@brown.com", password: "1234567890", password_confirmation: "1234567890", phone: "650-253-0000"},
    {name: "Olivia Jones", email: "olivia@jones.com", password: "1234567890", password_confirmation: "1234567890", phone: "415-555-5555"},
  ])

Sale.create([
    {user_id: 1, title: "Moving Sale", address: "123 Main St.", city: "Alameda", zipcode: 94501, date:"June 1, 2014", time_start: "7 am", time_end: "2 pm", description: "Moving out of state. Tons of great furniture!", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2OkM7C3DGtsd61jnoK9zKdBvPp-6DUfvr17qo4MYtcKSKKP71Cg"},
    {user_id: 2, title: "Estate Sale", address: "456 State St.", city: "Daly City", zipcode: 94014, date:"June 15, 2014", time_start: "8 am", time_end: "4 pm", description: "Everything must go! Cheap prices", photo: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSurtvZtjOUJy9ZaMd4Me5SYgB84bFoudAW6PjrVUxodoRfLk3www"},
    {user_id: 3, title: "Antiques", address: "789 Church St.", city: "San Francisco", zipcode: 94114, date:"June 9, 2014", time_start: "7 am", time_end: "6 pm", description: "Great antiques and collectables", photo: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcThZWW8SGHBUpsYLqwZ8nTRKX-nGoPbmNz9vg5HuXIQpdRUPb9xoQ"},
  ])

Item.create([
    {sale_id: 1, transaction_id: nil, name: "Sofa", description: "Brown leather, hardly used", price: 500, photo:"https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQxrd7En-8NHNK4aVry8QQyBZl0d7KQjQ2A5jEylSw82xJA3kFe_g"},
    {sale_id: 1, transaction_id: nil, name: "Queen Bed", description: "Wood frame, looks great", price: 350, photo: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTD7ix42XEtc326T1LPB0w7B5mx2gB8jgVfMMHEChufKBfanobP0w"},
    {sale_id: 2, transaction_id: nil, name: "Lamp", description: "Ugly brass lamp that works great", price: 50, photo: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSHQ2qKVw1cwccRppVJ-0HwZznCJNp_e3CHJCsOaSJxZPHLTl2fjA"},
    {sale_id: 3, transaction_id: nil, name: "Cabinet", description: "Antique mahogany cabinet with glass doors", price: 1000, photo: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR8CJoH8IYpZ8oFIrvJ_TMuImCyIVv-BnNjEcSjlHO7JPNBGYX55A"},
    {sale_id: 3, transaction_id: nil, name: "Bar Table", description: "1950s bar table with glass rack and liquor storage", price: 250, photo: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQjFEAbuk-y2psWgZyLWXCiPhzXeBnfnHmRhoaCcYO2BFx8VUwh"},
    {sale_id: 3, transaction_id: 4, name: "Chair", description: "Mid-Century Modern Chair", price: 300},
    {sale_id: 3, transaction_id: 5, name: "Coffee Table", description: "Mid-Century coffee table form set of Mad Men", price: 625}
  ])

Transaction.create([
    {user_id: 4, seller_id: 1, item_id: 2},
    {user_id: 5, seller_id: 2, item_id: 3},
    {user_id: 5, seller_id: 3, item_id: 5},
    {user_id: 1, seller_id: 3, item_id: 6},
    {user_id: 1, seller_id: 3, item_id: 7}

  ])