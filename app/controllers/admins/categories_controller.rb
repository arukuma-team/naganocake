class Admins::CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admins_categories_path(@category), notice: "カテゴリーを追加しました"
    else
      @categories = Category.all
      render 'admins/categories/index'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admins_categories_path, notice: "カテゴリーを変更しました"
    else
      render "admins/categories/edit"
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admins_categories_path, notice: "カテゴリーを削除しました"
  end

  private

  def category_params
    params.require(:category).permit(:category)
  end
end
