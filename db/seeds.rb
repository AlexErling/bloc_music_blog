Admin.create!(   
    name: "Alex Erling",
    email: "alexerling@gmail.com",
    password: "password"
    )

10.times do
    post = Post.create!(
        title: "Hi",
        body: "Hi",
        link: "Link",
        admin_id: 1
        )
end