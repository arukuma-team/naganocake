class Members::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
end
