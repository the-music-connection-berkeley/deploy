class FormsController < ApplicationController
  def index
    redirect_to '/'
  end

  def teacher
  end

  def parent
  end

  def tutor
      session[:q_page] = 0
      @q_page = 0
      render 'tutor'
  end

  def teacher_submit
    name = params[:question][:teacher_name]
    phone = params[:question][:phone]
    email = params[:question][:email]
    class_name = params[:question][:class_name]
    school_name = params[:question][:school_name]
    grade = params[:question][:grade]
    time_availavility = params[:question][:time_availavility]
    start_date = params[:question][:start_date]
    end_date = params[:question][:end_date]
    instruments = params[:question][:instruments]
    comment = params[:question][:comment]
    teacher = Teacher.new
    teacher.attributes = {name: name, phone: phone,
      email: email, class_name: class_name, school_name: school_name,
      grade: grade, time_availavility: time_availavility, start_date: start_date,
    end_date: end_date, instruments: instruments, comment: comment}
    teacher.save!
    render 'thank_you'
  end

  def parent_submit
    name = params[:question][:name]
    phone = params[:question][:phone]
    email = params[:question][:email]
    address = params[:question][:address]
    grade = params[:question][:grade]
    time_availavility = params[:question][:time_availavility]
    piano = params[:question][:piano]
    instruments = params[:question][:instruments]
    experiences = params[:question][:experiences]
    pastapp = params[:question][:pastapp]
    lunch = params[:question][:lunch]
    parent = Parent.new
    parent.attributes = {name: name, phone: phone,
      email: email, address: address, piano: piano,
      grade: grade, instruments: instruments, experiences: experiences,
    pastapp: pastapp, lunch: lunch}
    parent.save!
    render 'thank_you'
  end

  def tutor_submit
    name = params[:question][:name]
    phone = params[:question][:phone]
    email = params[:question][:email]
    sid = params[:question][:sid]
    year = params[:question][:year]
    major = params[:question][:major]
    minor = params[:question][:minor]
    experiences = params[:question][:experiences]
    time_availavility = params[:question][:time_availavility]
    preferred_grade = params[:question][:preferred_grade]
    in_class = params[:question][:in_class]
    instruments = params[:question][:instruments]
    private = params[:question][:private]
    piano = params[:question][:piano]
    returning = params[:question][:returning]
    prev_again = params[:question][:prev_again]
    interview_time = params[:question][:interview_time]

    tutor = Tutor.new
    tutor.attributes = {name: name, phone: phone,
      email: email, sid: sid, year: year,
      major: major, minor: minor, experiences: experiences,
    in_class: in_class, instruments: instruments, time_availavility: time_availavility,
   preferred_grade: preferred_grade, private: private, piano: piano, returning: returning,
   prev_again: prev_again, interview_time: interview_time}
    tutor.save!
    render 'thank_you'
  end

end
