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
    weekday = params[:question][:weekday]
    start_time = params[:question][:start_time]
    end_time = params[:question][:end_time]
    instrument = params[:question][:instrument]
    comment = params[:question][:comment]
    teacher = Teacher.new
    teacher.attributes = {name: name, phone: phone,
      email: email, class_name: class_name, school_name: school_name,
      grade: grade, weekday: weekday, start_time: start_time, end_time: end_time, instrument: instrument, comment: comment}
    teacher.save!
    render 'thank_you'
  end

  def parent_submit
    name = params[:question][:name]
    phone = params[:question][:phone]
    email = params[:question][:email]
    address = params[:question][:address]
    grade = params[:question][:grade]
    weekday = params[:question][:weekday]
    start_time = params[:question][:start_time]
    end_time = params[:question][:end_time]
    piano_home = params[:question][:piano_home]
    instrument = params[:question][:instrument]
    experiences = params[:question][:experiences]
    pastapp = params[:question][:pastapp]
    lunch = params[:question][:lunch]
    parent = Parent.new
    parent.attributes = {name: name, phone: phone,
      email: email, address: address, grade: grade, weekday: weekday, start_time: start_time, end_time: end_time, piano_home: piano_home,
      instrument: instrument, experiences: experiences,
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
    weekday = params[:question][:weekday]
    start_time = params[:question][:start_time]
    end_time = params[:question][:end_time]
    preferred_grade = params[:question][:preferred_grade]
    in_class = params[:question][:in_class]
    instrument = params[:question][:instrument]
    private = params[:question][:private]
    piano_vocal = params[:question][:piano_vocal]
    returning = params[:question][:returning]
    prev_again = params[:question][:prev_again]
    preffered_student_class = params[:question][:preffered_student_class]
    comment = params[:question][:comment]

    tutor = Tutor.new
    tutor.attributes = {name: name, phone: phone,
      email: email, sid: sid, year: year,
      major: major, minor: minor, experiences: experiences, weekday: weekday, start_time: start_time, end_time: end_time,
    preferred_grade: preferred_grade, in_class: in_class, instrument: instrument,
    private: private, piano_vocal: piano_vocal, returning: returning,
   prev_again: prev_again, preffered_student_class: preffered_student_class, comment: comment}
    tutor.save!
    render 'thank_you'
  end

end
