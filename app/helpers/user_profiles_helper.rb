module UserProfilesHelper
    include ApplicationHelper

    def valid_profile_editor?
        return params[:id].to_i == session[:id]
    end
    
    def validate_profile_editor
        is_editor = valid_profile_editor?
        do_error(:unauthorized) if !is_editor
        return is_editor
    end
end
