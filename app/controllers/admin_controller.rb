class AdminController < ApplicationController
    def home
    end

    def open_form
        session[:form_opened] = true
        flash[:notice] = 'Form is now opened!'
        redirect_to '/admin/welcome'
    end

    def close_form
        session[:form_opened] = false
        flash[:notice] = 'Form has been closed!'
        redirect_to '/admin/welcome'
    end

    def generate_matches
      @tutors = Tutor.where("tutors.comment != '' or tutors.preferred_student_class != ''")
      @teachers = Teacher.where.not(comment: [nil, ""])
      @parents = Parent.where.not(comment: [nil, ""])
      render 'generate_matches'
    end

    def run_algo
      Matcher.new.main
      flash[:notice] = 'Matching has been completed!'
      redirect_to '/admin/welcome'
    end

    def results
    end

    def match_pair
    puts JSON.parse(request.body.read)
    # response = JSON.parse(request.body.read)
    Tutor.get(response[tutor_id]).matched = "true";
    client_type = resposne[client_id][0]
    if client_type == "p"
      Parent.get(response[client_id][1..-1]).matched = "true";
    else
      Teacher.get(response[client_id][1..-1]).matched = "true";
    end
    Match.create(:tutor_id => response[tutor_id], :tutee_id => rseponse[tutor_id])
    render text: ""
  end

  def undo_pair
    puts JSON.parse(request.body.read)
    # response = JSON.parse(request.body.read)
    Tutor.get(response[tutor_id]).matched = "false";
    client_type = resposne[client_id][0]
    if client_type == "p"
      Parent.get(response[client_id][1..-1]).matched = "false";
    else
      Teacher.get(response[client_id][1..-1]).matched = "false";
    end
    Match.where(:tutor_id => response[tutor_id], :tutee_id => rseponse[tutor_id]).destroy
    render text: ""
  end


    def reset_database
        Teacher.delete_all
        Tutor.delete_all
        Parent.delete_all
        Match.delete_all
        flash[:notice] = 'Database has been reset!'
        redirect_to '/admin/welcome'
    end

    def reset_matching
        Teacher.all.each do |t|
            t['matched'] = false
        end
        Tutor.all.each do |t|
            t['matched'] = false
        end
        Parent.all.each do |p|
            p['matched'] = false
        end
        Match.delete_all
        flash[:notice] = 'Matching has been reset!'
        redirect_to '/admin/welcome'
    end
end
