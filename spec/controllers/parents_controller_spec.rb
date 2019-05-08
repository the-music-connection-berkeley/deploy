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
end
