class FavoriteMailer < ApplicationMailer
  default from: "joseph.hakoopian@gmail.com"

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@secret-beyond-72648>"
    headers["In-Reply-To"] = "<post/#{post.id}@secret-beyond-72648>"
    headers["References"] = "<post/#{post.id}@secret-beyond-72648>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)
    headers["Message-ID"] = "<posts/#{post.id}@secret-beyond-72648>"
    headers["In-Reply-To"] = "<post/#{post.id}@secret-beyond-72648>"
    headers["References"] = "<post/#{post.id}@secret-beyond-72648>"

    @post = post

    mail(to: post.user.email, subject: "You're following #{post.title}.")
  end
end
