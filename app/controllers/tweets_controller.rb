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

  def extract_hashtags
    @tweet.content.split(' ').filter do |elem|
      elem.start_with?('#')
    end
  end

  def get_hashtags_models(hashtags)
    tags_return = []
    for tag in hashtags
      fetched_tag = Tag.find_by(label: tag)
      if fetched_tag
        tags_return.push(fetched_tag)
      else
        new_tag = Tag.create(label: tag)
        tags_return.push(new_tag)
      end
    end
    tags_return
  end

  def create
    @tweet = Tweet.new(tweet_params)
    hashtags = extract_hashtags
    # Lire les tags pour récupérer le tag correspondant en base de données
    tags = get_hashtags_models(hashtags)
    # Lier les deux Tweet <-> Tag
    for tag in tags
      @tweet.tags.push(tag)
    end
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
      redirect_to tweet_path(@tweet), notice: 'Wrong'
    end
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
