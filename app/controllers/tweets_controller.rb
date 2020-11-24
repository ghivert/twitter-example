class TweetsController < ApplicationController
  before_action :authorize_user, only: [:new, :create, :edit, :update]
  before_action :set_tweet, only: [:edit, :update]
  before_action :redirect_user_if_no_tweet, only: [:edit, :update]

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

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to '/tweets'
    else
      redirect_to "/tweets/#{tweet.id}/edit", notice: 'Wrong'
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find_by(id: params[:id])
  end

  def authorize_user
    if @current_user.nil?
      redirect_to '/sign_in'
    end
  end

  def redirect_user_if_no_tweet
    if @tweet.nil? || @current_user.id != @tweet.user.id
      redirect_to '/tweets'
    end
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
