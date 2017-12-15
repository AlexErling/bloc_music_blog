Admin.create!(   
    name: "Alex Erling",
    email: "alexerling@hotmail.com",
    password: "password"
    )

10.times do
    post = Post.create!(
        title: "Feel so Close",
        body: "New Banger",
        link: '<iframe width="100%" height="20" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/352128353&amp;color=%233c3a35&amp;inverse=false&amp;auto_play=false&amp;show_user=true"></iframe>',
        admin_id: 1
        )
        
        post = Post.create!(
        title: "Wrong is sick",
        body: "This is a new banger",
        link: '<iframe src="https://open.spotify.com/embed/track/2Xcd8DdY0iY6yldFjsQPih" width="25%" height="200" frameborder="0" allowtransparency="true"></iframe>',
        admin_id: 1
        )
end