FactoryGirl.define do
  factory :teacher do
    name 'No name'
    phone '818-348-3833'
    email 'musicconnection@gmail.com'
    class_name 'best class'
    school_name 'best school'
    grade '9'
    availabilities '1'
    instrument 'Piano'
    comment 'no comment'
    number_of_matches 0
    matched false
  end
end
