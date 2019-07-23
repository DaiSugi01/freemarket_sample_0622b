require 'rails_helper'

describe TblAddressController do
  describe 'get#new' do
    it 'get @prefs' do
      @prefs = create_list(:mst_prefecture, 47) 
      get :new, params: { tbl_user_id: '13' }
      expect(assigns(prefs)).to match(@prefs)
    end  
  end
end