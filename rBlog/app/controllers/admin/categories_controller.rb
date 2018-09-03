class Admin::CategoriesController < Admin::ApplicationController
  def new
    @page_title = 'Add cateory'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice]="category created"
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice]="category updated"
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice]="category deleted"
    redirect_to admin_categories_path
  end

  def index
    @categories = Category.all
  end

  def show
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
