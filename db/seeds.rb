User.destroy_all
UserProfile.destroy_all
TextPost.destroy_all

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

TextPost.create([
    {
        user_profile_id: UserProfile.first.id,
        title: "This is a Title",
        content: "This is content",
        upvotes: 0,
        downvotes: 0
    },
    {
        user_profile_id: UserProfile.first.id,
        title: "This is also a Title",
        content: "This is also content",
        upvotes: 0,
        downvotes: 0
    }
])