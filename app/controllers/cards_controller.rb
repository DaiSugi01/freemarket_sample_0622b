class CardsController < ApplicationController

  def index
  end

  def new
    @card = TblCard.new
  end

  def create
    begin 
      token = TblCard.create_card_to_payjp(params)
      card = TblCard.create({token: token.id, tbl_user_id: current_tbl_user.id})
      card.save
      redirect_to card_path
    rescue
      redirect_to new_card_path, alert: 'クレジットカード登録に失敗しました'
    end
  end
end
