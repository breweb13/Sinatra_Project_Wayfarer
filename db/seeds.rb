breanna = User.create(username: "user1", image_url: "https://images.pexels.com/photos/1666073/pexels-photo-1666073.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", password: "welcome")

Post.create(location: "Where did you go Nomad?", image_url: "https://images.pexels.com/photos/1051075/pexels-photo-1051075.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500", journal: "", user_id: bre_webster.id)