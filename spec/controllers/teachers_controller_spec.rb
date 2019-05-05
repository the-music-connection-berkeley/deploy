require 'rails_helper'
describe TeachersController do
  describe 'GET index' do
    let!(:teacher) {FactoryGirl.create(:teacher)}

    it 'should assign instance variable for teachers' do
      get :index
      expect(teacher.name).to eql(Teacher.first.name)
    end
  end
end
