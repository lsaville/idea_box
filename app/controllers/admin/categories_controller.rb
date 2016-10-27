class Admin::CategoriesController < ApplicationController
  before_action :require_admin

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully created category!"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save
      flash[:success] = "Successfully updated category!"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.delete
    flash[:success] = "Successfully deleted #{@category.name}"
    redirect_to admin_categories_path
  end

  private

  def require_admin
    render file: '/public/404' unless current_admin?
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
