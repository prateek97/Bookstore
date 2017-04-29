class MenuController < ApplicationController
  def index
    if params[:section].nil?
      @food_items = FoodItem.all.order(params[:sort_param])
    else
      @food_items = FoodItem.by_section(params[:section]).order(params[:sort_param])
    end
    @sections = %w(Novels SchoolBooks CompetitionBooks CollegeBooks)
  end
end