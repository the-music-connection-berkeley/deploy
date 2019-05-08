class Matcher

    possible_matches = Hash.new([])
    sorted_tutors = Tutors.all

    def initialize
    end

    def match_counter
        teachers = Teacher.all
        tutors = Tutor.all
        parents = Parent.all

        tutors.each do |tutor|
          if tutor.private == "yes":
            parent_counter(tutor)
          end
          if tutor.in_class = "yes":
            teacher_counter(tutor)
          end
        end
    end

    def parent_counter(tutor)
      Parents.all.each do |parent|
        if tutor.piano_vocal == parent.instrument[0] && time_matches?(tutor, parent)
          tutor.number_of_matches += 1
          parent.number_of_matches += 1
          possible_matches[tutor.id] += [parent]
        end
      end
    end

    def teacher_counter(tutor)
      instruments = tutor.instruments.split("&")
      Teacher.all.each do |teacher|
        instruments.each do |instrument|
          if instrument in teacher.instruments && time_matches?(tutor, teacher)
            tutor.number_of_matches += 1
            teacher.number_of_matches += 1
            possible_matches[tutor.id] += [teacher]
            break
          end
        end
      end
    end

    //"1&2" -> parsing -> availabilities.find(1,2)
    def time_matches?(tutor, teacher)
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

    def sort
       sorted_tutors.sort_by{ |tutor| tutor.number_of_matches }
       possible_matches.each do |tutor_id|
         possible_matches[tutor_id].sort_by{ |tutee| tutee.number_of_matches }
       end
    end

    def final_match
      sorted_tutors.each do |sorted_tutor|
        possible_matches[sorted_tutor.id].each do |tutee|
          if tutee.matched == 0
            tutee.matched = 1
            tutor.matched = 1
            Matched.tutor = tutor
            Matched.teacher = tutor
            break
          end
        end
      end
    end

end
