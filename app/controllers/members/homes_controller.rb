class Members::HomesController < ApplicationController
  
  def top
    @categories = Category.all
    @items = Item.all
  end
  
  def about 
  end
  
end
