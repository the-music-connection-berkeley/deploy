require 'rails_helper'
describe TeachersController do
  describe 'GET index' do
    let!(:teacher) {FactoryGirl.create(:teacher)}

    it 'should assign instance variable for teachers' do
      get :index
      expect(teacher.name).to eql(Teacher.first.name)
    end
  end
  describe 'POST create' do

    it 'should create new teacher' do
      post :create, :params => {:name => 'No name',
      :phone => '818-348-3833',
      email: 'musicconnection@gmail.com',
      class_name: 'best class',
      school_name: 'best school',
      grade: '9',
      time_availability: "3-5",
      instruments: 'Piano',
      comment: 'no comment'}
      expect(Teacher.count).to eql (1)
    end
end
describe 'DELETE ' do
  let!(:teacher1) {FactoryGirl.create(:teacher)}

  it 'destroys a teacher' do
    expect { delete :destroy, id: teacher1.id
    }.to change(Teacher, :count).by(-1)
  end
end
end
