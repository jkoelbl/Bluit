class UserGenerator < Struct.new(:user_params)
    def generate
        create_user
        create_user_profile
        create_login
    end

    private

    def create_user
        @user = User.new
        if User.new_user?(user_params)
            @user = User.create(user_params)
        end
    end

    def create_user_profile
        if @user.id
            @profile = UserProfile.create(user_id: @user.id)
        end
    end

    def create_login
        if @user.id and @profile.id
            @login = {
                :id => @user.id,
                :username => @user.username
            }
        end
    end
end