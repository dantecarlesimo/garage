User.create([
    {name: "John Smith", email: "john@smith.com", password: "1234567890", password_confirmation: "1234567890", phone: "3479214269"},
    {name: "Noah Johnson", email: "noah@johnson.com", password: "1234567890", password_confirmation: "1234567890", phone: "4152229670"},
    {name: "Sophia Williams", email: "sophia@williams.com", password: "1234567890", password_confirmation: "1234567890", phone: "6505434800"},
    {name: "Liam Brown", email: "liam@brown.com", password: "1234567890", password_confirmation: "1234567890", phone: "6502530000"},
    {name: "Olivia Jones", email: "olivia@jones.com", password: "1234567890", password_confirmation: "1234567890"},
  ])

Sale.create([
    {user_id: 1, title: "Moving Sale", address: "123 Main St.", city: "Alameda", zipcode: 94501, date:"June 1, 2014", time_start: "7 am", time_end: "2 pm", description: "Moving out of state. Tons of great furniture!"},
    {user_id: 2, title: "Estate Sale", address: "456 State St.", city: "Daly City", zipcode: 94014, date:"June 15, 2014", time_start: "8 am", time_end: "4 pm", description: "Everything must go! Cheap prices"},
    {user_id: 3, title: "Antiques", address: "789 Church St.", city: "San Francisco", zipcode: 94114, date:"June 9, 2014", time_start: "7 am", time_end: "6 pm", description: "Great antiques and collectables"},
    {user_id: 4, title: "Kids Toy Sale", address: "1234 Side St.", city: "San Mateo", zipcode: 94002, date:"June 23, 2014", time_start: "7 am", time_end: "1 pm", description: "Lots of kids toys, stuffed animals, books, etc"},
    {user_id: 5, title: "Kitchen Sale", address: "5678 Baker St.", city: "San Francisco", zipcode: 94114, date:"June 11, 2014", time_start: "6 am", time_end: "1 pm", description: "Kitchen appliances, cookware, and dishes"}
  ])