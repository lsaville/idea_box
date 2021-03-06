class IdeasController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @idea = Idea.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = "Successfully created an idea!"
      redirect_to user_idea_path(@user, @idea)
    else
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :description, :notes, :category_id)
  end
end
