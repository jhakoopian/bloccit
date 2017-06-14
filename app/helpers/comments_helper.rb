module CommentsHelper
  def user_is_authorized_for_comment?(comment)
    current_user && (current_user == comment.user || current_user.admin?)
  end

  def render_comments_for(comments)
    output = ""
    unless @user.comments.any?
      output += "<h2>There are no comments yet</h2>"
    else
      output += render @user.comments
    end
    output.html_safe
  end
end
