class HomepageController < ApplicationController
  def index
    # Only return the lastest 3 posts to the homepage
    @posts = Post.all.limit(3).order created_at: :desc
  end
end
