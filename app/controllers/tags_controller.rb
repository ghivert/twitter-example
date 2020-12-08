class TagsController < ApplicationController
  def show
    @hashtag = Tag.find_by(id: params[:id])
  end
end
