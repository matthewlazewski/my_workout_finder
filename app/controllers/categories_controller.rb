class CategoriesController < ApplicationController
    def index 
        @categories = Categories.all 
    end

    def new 
        @cateogry = Category.new 
    end

    def create

    end

    private
    def category_params 
        params.require(:category).permit(:name)
    end
end