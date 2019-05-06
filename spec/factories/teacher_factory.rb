FactoryGirl.define do
  factory :teacher do
    name 'No name'
    phone '818-348-3833'
    email 'musicconnection@gmail.com'
    class_name 'best class'
    school_name 'best school'
    grade '9'
    weekday "Monday"
    start_time "3"
    end_time "5"
    instrument 'Piano'
    comment 'no comment'
  end
end
