class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(title: params[:category_title].humanize(capitalize: true))
  end
end
