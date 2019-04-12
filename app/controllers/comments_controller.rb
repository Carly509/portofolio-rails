class CategoriesController < ApplicationController

before_action :set_category, only: [:show, :edit, :update, :delete, :destroy]
before_action :require_admin, except:[:index, :show]


  def index
    @category=Category.all
  end

  def new 
    @category= Category.new
  end

  def create 
    @category =Category.new(param_category)
    if @category.save
        redirect_to @category

      else
        render 'new'
      end
  end

    def show


    end
end