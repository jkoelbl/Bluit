User.destroy_all
UserProfile.destroy_all

User.create([
    {
        username: 'root',
        password: '123456'
    }
])

UserProfile.create([
    {
        user_id: User.first.id,
        display_name: 'Super-root',
        about: 'Only the most super of superusers',
        strength: 0
    }
])