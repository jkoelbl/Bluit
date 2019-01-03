module UserProfilesHelper
    include ApplicationHelper

    def valid_editor?
        return params[:id].to_i == session[:id]
    end
    
    def validate_editor
        unless valid_editor?
            do_error(:unauthorized)
            return false
        end
        return true
    end
end
