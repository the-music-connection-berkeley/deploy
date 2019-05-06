require 'rails_helper'
describe TutorsController do
  describe 'GET index' do
    let!(:tutor) {FactoryGirl.create(:tutor)}

    it 'should assign instance variable for tutors' do
      get :index
      expect(tutor.name).to eql(Tutor.first.name)
    end
  end
  describe 'POST create' do
    it 'should create new tutor' do
      post :create, :params => {name: 'No name',
      phone: '818-348-3833',
      sid: '303032009',
      email: 'musicconnection@gmail.com',
      year: '9',
      major: 'CS',
      minor: 'CS',
      experiences: '6 months',
      time_availability: "3-5",
      preferred_grade: '7~9',
      instruments: 'Piano',
      private: 'Yes',
      piano_vocal: 'Piano',
      returning: 'Yes',
      prev_again: 'Yes',
      preffered_student_class: "none",
      comment: 'no comment'}
      expect(Tutor.count).to eql (1)
    end
end
describe 'DELETE ' do
  let!(:tutor1) {FactoryGirl.create(:tutor)}

  it 'destroys a tutor' do
    expect { delete :destroy, id: tutor1.id
    }.to change(Tutor, :count).by(-1)
  end
end
end
