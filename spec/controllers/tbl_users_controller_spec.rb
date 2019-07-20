require 'rails_helper'

# deviseの機能そのものはテストから省略
describe TblUser::RegistrationsController do
  describe 'post#create' do

=begin
    context 'can save' do
      let(:params) { { resource: attributes_for(:tbl_user), nicknaem: 'てすと'  } }
        subject {
          post :create,
          params: params
        }

      it 'insert tbl_profile' do
        expect{ subject }.to change(TblProfile, :count).by(1)
      end

      it 'redirect to address_path' do
        subject
        expect(response).to redirect_to(address_path)
      end
    end
=end
  end
end