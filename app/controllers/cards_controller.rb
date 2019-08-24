class CardsController < ApplicationController

  def index
  end

  def new
    @card = TblCard.new
  end

end
