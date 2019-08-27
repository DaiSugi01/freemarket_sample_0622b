class TblCard < ApplicationRecord

  require 'payjp'
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

  belongs_to :tbl_user

  def self.create_card_to_payjp(params)
    # トークンを作成 
    token = Payjp::Token.create({
      card: {
        number:     params['number'],
        cvc:        params['cvc'],
        exp_month:  params['valid_month'],
        exp_year:   params['valid_year']
      }},
      {'X-Payjp-Direct-Token-Generate': 'true'} 
    )
    # 上記で作成したトークンをもとに顧客情報を作成
    Payjp::Customer.create(card: token.id)
  end

  def self.destroy_card_of_payjp(card)
    customer = Payjp::Customer.retrieve(card.token)
    card = customer.cards.retrieve(customer.cards.data[0].customer)
    card.delete
  end

  def self.pay(amount,token_id)
    token = Payjp::Customer.retrieve(token_id)
    charge = Payjp::Charge.create(
      amount:  amount,
      customer: token.id,
      currency: 'jpy',
    )
  end

  def self.make_month(month)
    #有効期限-月の値を加工する。
    month = month.to_s
    if month.length == 1
      return "0" + month
    end
  end

  def self.make_year(year)
    #有効期限-年の値を加工する。
    year = year.to_s.slice(2, 2)
  end
end
