require 'rails_helper'
describe FormsController do
  describe 'GET index' do
    it 'should render the home page' do
      get :index
      expect(response).to redirect_to('/')
    end
  end
  describe "GET tutor" do
    it "has a 200 status code" do
      get :tutor
      expect(response.status).to eq(200)
    end
  end
  describe "GET parent" do
    it "has a 200 status code" do
      get :parent
      expect(response.status).to eq(200)
    end
  end
  describe "GET teacher" do
    it "has a 200 status code" do
      get :teacher
      expect(response.status).to eq(200)
    end
  end
end
