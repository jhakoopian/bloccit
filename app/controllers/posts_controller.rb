class PostsController < ApplicationController
  def index
    @posts = Post.all
    # index = 0
    # while index < @posts.length
    #   @posts[index].title = "SPAM" if index % 5 == 0
    #   index += 1
    # end
    @posts.each_with_index do |post, index|
      post.title = "SPAM" if index % 5 == 0
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
