module FavoritesHelper
  def render_favorites_for(favorites)
    output = ""
    unless @user.favorites.any?
      output += "<h2>There are no favorites yet</h2>"
    else
      output += render @user.favorites
    end
    output.html_safe
  end
end
