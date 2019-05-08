class AdminController < ApplicationController
  def home
  end

  def close_form
  end

  def generate_matches
  end
  def run_algo
    Matcher.new.main
    render text: ""
  end
  def results
  end
  def match_pair
    puts JSON.parse(request.body.read)
    render text: ""
  end

  def undo_pair
    puts JSON.parse(request.body.read)
    render text: ""
  end
end
