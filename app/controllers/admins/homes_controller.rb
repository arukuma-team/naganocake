class Admins::HomesController < 
  
  def top
    @categories = Category.all
  end
  
  def about
  end
  
end
