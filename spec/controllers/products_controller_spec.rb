# require 'spec_helper'
require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "GET #index" do

    it "renders index" do
      get :index
      expect(response).to render_template :index
    end

  end

end
