FactoryGirl.define do
  factory :teacher do
    name 'No name'
    phone '818-348-3833'
    email 'musicconnection@gmail.com'
    class_name 'best class'
    school_name 'best school'
    grade '9'
    time_availability "3-5"
    instruments 'Piano'
    comment 'no comment'
  end
end
