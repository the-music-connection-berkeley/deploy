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
  describe "POST teacher_submit" do
    it "successfully submits" do
      post :teacher_submit, :question => {:teacher_name => "My name", :phone => "818",
      :weekday => ["Monday", "Tuesday"], :start_time => ["2", "3"], :end_time => ["4", "6"],
      :instrument => ["Oboe"]}
    end
  end
  describe "POST tutor_submit" do
    it "successfully submits" do
      post :tutor_submit, :question => {:name => "My name", :phone => "818",
      :weekday => ["Monday", "Tuesday"], :start_time => ["2", "3"], :end_time => ["4", "6"],
      :instrument => ["Oboe"]}
    end
  end
  describe "POST parent_submit" do
    it "successfully submits" do
      post :parent_submit, :question => {:name => "My name", :phone => "818",
      :weekday => ["Monday", "Tuesday"], :start_time => ["2", "3"], :end_time => ["4", "6"],
      :instrument => ["Oboe"]}
    end
  end
end
