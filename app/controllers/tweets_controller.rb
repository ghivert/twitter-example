class TweetsController < ApplicationController
  before_action :authorize_user, only: [:new, :create, :edit, :update, :delete]
  before_action :set_tweet, only: [:edit, :update, :delete]
  before_action :redirect_user_if_no_tweet, only: [:edit, :update, :delete]

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
      redirect_to new_tweet_path, notice: 'Wrong'
    end
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      redirect_to edit_tweet_path(@tweet), notice: 'Wrong'
    end
  end

  def delete
    @tweet.update(deleted_at: Time.now)
    redirect_to tweets_path
  end

  private

  def set_tweet
    @tweet = Tweet.find_by(id: params[:id])
  end

  def authorize_user
    if @current_user.nil?
      redirect_to sign_in_path
    end
  end

  def redirect_user_if_no_tweet
    if @tweet.nil? || @current_user.id != @tweet.user.id
      redirect_to tweets_path
    end
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
