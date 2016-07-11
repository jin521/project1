class StoriesController < ApplicationController

  before_action :get_story, only: [:edit, :show, :update, :destroy, :like, :unlike]

  def index
      @stories = Story.all
  end

  def new
      @story = Story.new
  end


  def create
    story = Story.new story_params
    story.user_id = @current_user.id
    redirect_to story
  end

  def edit
  end

  def update
    @story.update story_params
    redirect_to @story
  end

  def show
  end


  def destroy
    @story.destroy
    redirect_to stories_path
  end

  def like
    Like.create story_id: params[:id], user_id: @current_user.id, whisky: params[:whisky]

    redirect_to @story
  end

  def unlike
    Like.find_by(story_id: params[:id], user_id: @current_user.id).destroy

    redirect_to @story
  end

  private
    def story_params
      params.require(:story).permit(:title, :content)
    end

    def get_story
      @story = Story.find params[:id]
    end
end
