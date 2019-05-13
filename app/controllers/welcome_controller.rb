class WelcomeController < ApplicationController
  def index
  end

  # def reset_database
  #     Teacher.delete_all
  #     Tutor.delete_all
  #     Parent.delete_all
  #     Match.delete_all
  # end
  #
  # def reset_matching
  #     Teacher.all.each do |t|
  #         t['matched'] = false
  #     end
  #     Tutor.all.each do |t|
  #         t['matched'] = false
  #     end
  #     Parent.all.each do |p|
  #         p['matched'] = false
  #     end
  #     Match.delete_all
  # end
end
