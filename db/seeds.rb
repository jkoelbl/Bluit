User.destroy_all

User.create([
    {
        username: 'root',
        password: '123456'
    }
])