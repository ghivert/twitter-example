class TweetsController < ApplicationController
  before_action :authorize_user, only: [:new, :create]

  def index
    @tweets = Tweet.all
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = @current_user
    if @tweet.save
      redirect_to tweets_path
    else
      redirect_to '/tweets/new', notice: 'Wrong'
    end
  end

  private

  def authorize_user
    if @current_user.nil?
      redirect_to '/sign_in'
    end
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
