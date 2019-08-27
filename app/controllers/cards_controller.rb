class CardsController < ApplicationController

  def index
  end

  def new
    @card = TblCard.new
  end

  def create
    begin
      token = TblCard.create_card_to_payjp(params)
      expire_month = TblCard.make_month(token.cards.data[0].exp_month)
      expire_year = TblCard.make_year(token.cards.data[0].exp_year)
      card = TblCard.create({brand:token.cards.data[0].brand,
                             expire_month: expire_month,
                             expire_year: expire_year,
                             last_four_number: token.cards.data[0].last4.to_s,
                             token: token.id, 
                             tbl_user_id: current_tbl_user.id})
      card.save
      redirect_to cards_path
    rescue => e
      redirect_to new_card_path, alert: 'クレジットカード登録に失敗しました'
    end
  end
end
