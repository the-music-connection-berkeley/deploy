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
      expect(response).to redirect_to('/admin/welcome')
    end
    it 'should increase the number of matches' do
      expect{post :run_algo}.to change{Match.count}.by(2)
    end
  end
  describe 'GET open_form' do
    it 'should stay on the admin page' do
      get :open_form
      expect(response).to redirect_to('/admin/welcome')
    end
  end
  describe 'GET close_form' do
    it 'should stay on the admin page' do
      get :close_form
      expect(response).to redirect_to('/admin/welcome')
    end
  end
  describe 'GET reset_database' do
    it 'should remove all of database' do
      get :reset_database
      expect(Tutor.count).to eq(0)
    end
  end
  describe 'GET reset_matching' do
    it 'should remove all matches' do
      get :reset_matching
      expect(Match.count).to eq(0)
    end
  end
end
