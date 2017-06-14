module PostsHelper
  def user_is_authorized_for_post?(post)
    current_user && (current_user == post.user || current_user.admin?)
  end

  def render_posts_for(posts)
    output = ""
    unless @posts.any?
      output += "<h2>There are no posts yet</h2>"
    else
      output += render @posts
    end
    output.html_safe
  end
end
