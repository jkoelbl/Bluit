module TextPostsHelper
    def valid_post_editor?
        return TextPost.find(params[:id].to_i).user_profile_id == session[:id]
    end

    def validate_post_editor
        is_editor = valid_post_editor?
        do_error(:unauthorized) if !is_editor
        return is_editor
    end
end
