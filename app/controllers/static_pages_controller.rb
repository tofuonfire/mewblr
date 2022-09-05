class StaticPagesController < ApplicationController
  def home
    @latest_posts = Post.page(params[:page]).per(24)
    @popular_posts = Post.unscoped.joins(:likes).group(:post_id).order(Arel.sql('count(likes.user_id) desc')).page(params[:page]).per(24)
    @feed_posts = current_user.feed.page(params[:page]).per(12) if user_signed_in?
  end

  def todoapp
    render layout: false
  end

  def calendar
    if params[:month]
      @date = Date.new(
        params[:year].to_i,
        params[:month].to_i
        )
    else
      @date = Date.new(params[:year].to_i)
    end

    render layout: false
  end

  def help; end

  def contact; end
end
