class Matcher
    def initialize
    end

    def match
        teachers = Teacher.all
        tutors = Tutor.all
        parents = Parent.all

        tutors.each do |tutor|
          if tutor.private == "yes":
            if tutor.piano_vocal == "vocal":
              match(tutor, parents, "vocal")
            elsif tutor.piano_vocal == "piano":
              match(tutor, parents, "piano")
            end
          end
          if tutor.in_class = "yes":
            tutor.instruments.each do |instrument|
              match(tutor, teachers, instrument)
            end
          end
      end

    def match(tutor, tutees, instrument)
      tutees.each do |tutee|
        if instrument in tutee.instruments && time_matches?(tutor, tutee)
            tutor.number_of_matches += 1
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
