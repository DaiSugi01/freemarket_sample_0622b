# require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:tbl_user) { create(:tbl_user) }
  # let(:tbl_product) { create(:tbl_product) }

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

end
