require 'rails_helper'
describe TutorsController do
  describe 'GET index' do
    let!(:tutor) {FactoryGirl.create(:tutor)}

    it 'should assign instance variable for tutors' do
      get :index
      expect(tutor.name).to eql(Tutor.first.name)
    end
  end
end
