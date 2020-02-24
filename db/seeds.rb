ryan = User.create(id: 1, username: "Ryan", email: "ryan@ryan.com", password: "password")

ghosts = Record.create(id: 1, name: "Ghosts of the Great Highway", artist: "Sun Kil Moon", user_id: 1, image_url: "https://images-na.ssl-images-amazon.com/images/I/61F7fMQgJpL._SY400_.jpg" )
ziggy = Record.create(id: 2, name: "Rise and Fall of Ziggy Stardust", artist: "David Bowie", user_id: 1, image_url: "http://t0.gstatic.com/images?q=tbn%3AANd9GcTBneMgZ3WrvPGKLByRrerIAVZ44G-GHu6y4OskHogJwbClJrfDOhjh99VOLhE&usqp=CAc")
lennon = Record.create(id: 3, name: "Imagine", artist: "John Lennon", user_id: 1, image_url: "https://images-na.ssl-images-amazon.com/images/I/81x1qApGd9L._SX425_.jpg")
