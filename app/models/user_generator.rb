class UserGenerator < Struct.new(:user_params)
    def generate
        @user = User.new
        @profile = UserProfile.new
        @login = nil
        @user_exists = false
        create_user
        create_user_profile
        create_login
    end

    def degenerate
        User.find(@user.id).destroy if @user.id
        UserProfile.find(@profile.id).destroy if @profile.id
    end

    def user_exists?
        return @user_exists
    end

    private

    def create_user
        if @user_exists = User.new_user?(user_params)
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