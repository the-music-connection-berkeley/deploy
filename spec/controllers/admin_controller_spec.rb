require 'rails_helper'
describe AdminController do
  describe 'POST run_algo' do
    let!(:parent) {FactoryGirl.create(:parent)}
    let!(:teacher) {FactoryGirl.create(:teacher)}
    let!(:tutor) {FactoryGirl.create(:tutor)}
    let!(:availability) {FactoryGirl.create(:availability)}
    let!(:tutor2) {FactoryGirl.create(:tutor, :private => 'no')}

    it 'should stay on the admin page' do
      post :run_algo
      expect(response).to redirect_to('/admin')
    end
    it 'should increase the number of matches' do
      expect{post :run_algo}.to change{Match.count}.by(2)
    end
  end
  describe 'GET open_form' do
    it 'should stay on the admin page' do
      get :open_form
      expect(response).to redirect_to('/admin')
    end
  end
  describe 'GET close_form' do
    it 'should stay on the admin page' do
      get :close_form
      expect(response).to redirect_to('/admin')
    end
  end
end
