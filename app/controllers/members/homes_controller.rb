class Members::HomesController < ApplicationController
  
  def top
    @categories = Category.all
    @items = Item.limit(4)
  end
  
  def about 
  end
  
end
