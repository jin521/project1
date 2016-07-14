class StoriesController < ApplicationController

  before_action :get_story, only: [:edit, :show, :update, :destroy, :like, :unlike, :whisky]
  before_action :authorise_user, except: [:index, :show]  # anyone can see the index of all stories

  def index
    if params[:id].present?
      @stories = User.find(params[:id]).stories
    else
      @stories = Story.all
    end
  end

  def new
      @story = Story.new
  end


  def create

    story = Story.new story_params
    story.user_id = @current_user.id
    if story.save
      redirect_to story
    else
      render :new
    end
    # Story.create = Story.new then save
    # Story.update = setting the parameters then call save
  end

  def edit
  end

  def update
    @story.update story_params
    redirect_to @story   #implicitly pointing to this instance, same story_path(@story.id)
  end

  def show
  end


  def destroy
    @story.destroy
    redirect_to stories_path
  end


  def like
    Like.create story_id: @story.id, user_id: @current_user.id #, whisky: params[:whisky]
    redirect_to @story
  end

  def unlike
    Like.find_by(story_id: @story.id, user_id: @current_user.id).destroy
    redirect_to @story
  end


  private
    def story_params
      params.require(:story).permit(:title, :content)
    end

    def get_story
      @story = Story.find params[:id]
    end

    def authorise_user
      redirect_to login_path unless @current_user.present?
    end
end
