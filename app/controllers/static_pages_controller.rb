class StaticPagesController < ApplicationController
  def home
    @latest_posts = Post.page(params[:page]).per(24)
    if user_signed_in?
      @feed_posts = current_user.feed.page(params[:page]).per(12)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
