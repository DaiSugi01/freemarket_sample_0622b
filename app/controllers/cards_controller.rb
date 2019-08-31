class CardsController < ApplicationController

  def index
    @cards = TblCard.where(tbl_user_id: current_tbl_user.id)
  end

  def new
    @card = TblCard.new
  end

  def create
    begin
      token = TblCard.create_card_to_payjp(params)
      expire_month = TblCard.make_month(token.cards.data[0].exp_month)
      expire_year = TblCard.make_year(token.cards.data[0].exp_year)
      brand = TblCard.make_brand(token.cards.data[0].brand)
      card = TblCard.create({brand:brand,
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

  def destroy
    begin
      card = TblCard.find(params[:id])
      TblCard.destroy_card_of_payjp(card)
      card.destroy
      redirect_to cards_path
    rescue => e
      redirect_to cards_path, alert: 'クレジットカードの削除に失敗しました'
    end
  end
end
