class Matcher
    def initialize

    end
    def match_teacher_tutor
        teachers = Teacher.all
        tutors = Tutor.all

        teachers.each do |teacher|
            instrument = teacher.instruments
            filtered_tutors = tutors.where(instruments: instruments)
            filtered_tutors.each do |tutor|
                if time_matches?(tutor.time_availability, teacher.time_availability)
                    match = new MatchRecord(tutor: tutor, other: teacher)
                    match.save!
                    Tutor.remove(tutor)
                    Teacher.remove(teacher)
                    break
                end
            end
        end
    end

    "[[\"Wednesday\", [\"13:30\", \"14:00\"]], [\"Tuesday\", [\"13:00\", \"14:30\"]]]"
    def time_matches?(tutor_time, teacher_time)
        tutor_time.each do |time_block1|
            day1 = time_block1[0]
            range1 = Date.new(time_block1[1])
            teacher_time.each do |time_block2|
                day2 = time_block2[0]
                if day1 == day2
                    range2 = time_block2[1]
                    if range1[0] > range2[0]
                        low = range1[0]
                    else
                        low = range2[0]
                    end
                    if range1[1] < range2[1]
                        hi = range1[1]
                    else
                        hi = range2[1]
                    end
                    if low <= hi
                        intersection = hi - low
                    end
                    if intersection >= 1
                        return true
                    end
                end
            end
        end
    end


    def match_parent_tutor
    end
end
