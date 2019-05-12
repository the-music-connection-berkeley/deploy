class AdminController < ApplicationController
    def home
    end

    def open_form
        session[:form_opened] = true
        flash[:notice] = 'Form is now opened!'
        redirect_to '/admin'
    end

    def close_form
        session[:form_opened] = false
        flash[:notice] = 'Form has been closed!'
        redirect_to '/admin'
    end

    def generate_matches
    end

    def run_algo
      success = Matcher.new.main
      render text: success
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
