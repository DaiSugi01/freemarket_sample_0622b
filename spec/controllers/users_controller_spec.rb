# require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:tbl_user) { create(:tbl_user, id: 1) }
  let(:tbl_product) { create(:tbl_product) }

  describe "GET #mypage" do
    context 'log in' do
      before do
        login tbl_user
      end

      it "renders mypage" do
        get :mypage
        expect(response).to render_template :mypage
      end
    end

    context 'not log in' do

      it "redirects to root_path" do
        get :mypage
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET #sell_product" do
    context 'log in' do
      before do
        login tbl_user
      end

      it "renders sell_product" do
        get :sell_product
        expect(response).to render_template :sell_product
      end

      it "assgin @contents" do
        product = create_list(:tbl_product, 3, tbl_user_id: 1)
        get :sell_product
        expect(assigns(:contents)).to eq product
      end
    end

    context 'not log in' do

      it "redirects to root_path" do
        get :sell_product
        expect(response).to redirect_to(root_path)
      end
    end
  end

end
