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

  def self.pay(amount,token_id)
    token = Payjp::Customer.retrieve(token_id)
    charge = Payjp::Charge.create(
      amount:  amount,
      customer: token.id,
      currency: 'jpy',
    )
  end
end
