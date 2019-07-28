require 'rails_helper'

# deviseの機能そのものはテストから省略
describe TblUser::RegistrationsController, type: :controller do
  describe 'post#create' do

    context 'can save' do
      before do
        request.env['devise.mapping'] = Devise.mappings[:tbl_user]
      end

      let(:params) { { tbl_user: attributes_for(:tbl_user), nickname: 'テストタロウ' } }
        subject {
          post :create,
          params: params
        }

      it 'insert tbl_profile' do
        expect{ subject }.to change(TblProfile, :count).by(1)
      end

      it 'redirect to address_path' do
        subject
        tbl_user = TblUser.last(1)
        expect(response).to redirect_to(new_tbl_user_tbl_address_path(tbl_user_id: tbl_user[0].id))
      end
    end
  end
end