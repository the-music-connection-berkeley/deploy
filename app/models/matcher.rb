class Matcher

    possible_matches = Hash.new([])
    sorted_tutors = Tutors.all

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
          tutor['number_of_matches'] += 1
          parent['number_of_matches'] += 1
          possible_matches[tutor['id']] += [parent]
        end
      end
    end

    def teacher_counter(tutor)
      instruments = tutor.instruments.split("&")
      Teacher.all.each do |teacher|
        instruments.each do |instrument|
          if instrument in teacher.instruments && time_matches?(tutor, teacher)
            tutor['number_of_matches'] += 1
            teacher['number_of_matches'] += 1
            possible_matches[tutor['id']] += [teacher]
            break
          end
        end
      end
    end

    # ["1&2&3"]
 def get_times(person)
     ret = []
     person['availabilities'].split('&').each do |tid|
         ret.append(Availability.find(id=tid))
     end
 end

 def time_matches?(tutor, tutee)
     get_day = lambda {|t| t['weekday']}
     get_start = lambda {|t| t['start_time'].split(':')}
     get_end = lambda {|t| t['end_time'].split(':')}
     i = j = 0

     tutor_times = get_times(tutor) # [{'weekday': 'Tuesday', 'start_time': '6', 'end_time': '9'}]
     tutee_times = get_times(tutee)

     tutor_times.each do |t1|
         tutee_times.each do |t2|
             if get_day(t1) == get_day(t2)
                 start_t = [get_start(t1), get_start(t2)].max
                 end_t = [get_end(t1), get_end(t2)].min
                 if (end[0].to_i*60 + end[1].to_i) - (start[0].to_i*60 + start[1].to_i) >= 60
                     if !(tutor['id'] in self.matched_records)
                         self.matched_records[tutor['id']] = []
                     end
                     self.matched_records[tutor['id']] << tutee['id']
                 end
             end
         end
     end
 end

    def sort
       sorted_tutors.sort_by{ |tutor| tutor['number_of_matches'] }
       possible_matches.each do |tutor_id|
         possible_matches[tutor_id].sort_by{ |tutee| tutee['number_of_matches'] }
       end
    end

    def final_match
      sorted_tutors.each do |sorted_tutor|
        possible_matches[sorted_tutor['id']].each do |tutee|
          if tutee['matched'] == 0
            tutee['matched'] = 1
            tutor['matched'] = 1
            Matched.tutor = tutor
            Matched.teacher = tutor
            break
          end
        end
      end
    end

end
