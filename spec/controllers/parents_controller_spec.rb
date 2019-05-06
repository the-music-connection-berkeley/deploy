require 'rails_helper'
describe ParentsController do
  describe 'GET index' do
    let!(:parent) {FactoryGirl.create(:parent)}

    it 'should assign instance variable for parents' do
      get :index
      expect(parent.name).to eql(Parent.first.name)
      expect(parent.email).to eql(Parent.first.email)
    end
  end

  describe 'POST #create' do

    it 'should create new parent' do
      post :create, :params => {:name => 'No name',
      :phone => '818-348-3833',
      email: 'musicconnection@gmail.com',
      address: "Deadman's Lane",
      grade: '9',
      piano_home: 'Yes',
      weekday: "3-5",
      start_time: "3-5",
      end_time: "3-5",
      instrument: 'Piano',
      experiences: '6 months',
      pastapp: 'Yes',
      lunch: 'Yes'}
      expect(Parent.count).to eql (1)
    end
  end
  describe 'DELETE ' do
    let!(:parent1) {FactoryGirl.create(:parent)}

    it 'destroys a parent' do
      expect { delete :destroy, id: parent1.id
      }.to change(Parent, :count).by(-1)
    end
  end
end
