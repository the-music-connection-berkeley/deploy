FactoryGirl.define do
  factory :parent do
    name 'No name'
    phone '818-348-3833'
    email 'musicconnection@gmail.com'
    address "Deadman's Lane"
    grade '9'
    piano_home 'Yes'
    time_availability "3-5"
    instruments 'Piano'
    experiences '6 months'
    pastapp 'Yes'
    lunch 'Yes'
    created_at 'false'
    updated_at 'false'
  end
end
t.string   "name"
t.string   "phone"
t.string   "email"
t.string   "address"
t.string   "grade"
t.string   "piano_home"
t.string   "time_availability"
t.string   "instruments"
t.string   "experiences"
t.string   "pastapp"
t.string   "lunch"
t.datetime "created_at",        null: false
t.datetime "updated_at",
