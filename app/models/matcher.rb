class Matcher
    #match_counter -> sort -> final_match
    #key = tutor_id, value = [possible matched parents or teachers]
    @possible_matches
    @sorted_tutors

    def initialize
        @possible_matches = {}
        @sorted_tutors = Tutor.all
    end

    def possible_matches
        @possible_matches
    end


    def main
        match_counter
        sort
        final_match
        puts "Algorithm succesful."
    end

    def match_counter
        teachers = Teacher.all
        tutors = Tutor.all
        parents = Parent.all

        tutors.each do |tutor|
            if tutor['private'] == "yes"
                parent_counter(tutor)
            else
                teacher_counter(tutor)
            end
        end
    end

    #it saves the #of matches and updates hashmap
    def parent_counter(tutor)
      instruments = tutor.instrument.split("&")
        Parent.all.each do |parent|
          instruments.each do |instrument|
              if parent.instrument.include? instrument and time_matches?(tutor, parent)
                  tutor['number_of_matches'] += 1
                  parent['number_of_matches'] += 1
                  if @possible_matches.key? tutor['id']
                      @possible_matches[tutor['id']] += [parent]
                  else
                      @possible_matches[tutor['id']] = [parent]
                  end
              end
            end
        end
    end

    #it saves the #of matches and updates hashmap
    def teacher_counter(tutor)
        instruments = tutor.instrument.split("&")
        Teacher.all.each do |teacher|
            instruments.each do |instrument|
                if teacher.instrument.include? instrument and time_matches?(tutor, teacher)
                    tutor['number_of_matches'] += 1
                    teacher['number_of_matches'] += 1
                    if @possible_matches.key? tutor['id']
                        @possible_matches[tutor['id']] += [teacher]
                    else
                        @possible_matches[tutor['id']] = [teacher]
                    end
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
        return ret
    end

    # it's working dont change
    def time_matches?(tutor, tutee)
        i = j = 0
        possible = false
        tutor_times = get_times(tutor) # [{'weekday': 'Tuesday', 'start_time': '12:00', 'end_time': '14:00'}]
        tutee_times = get_times(tutee)

        tutor_times.each do |t1|
            tutee_times.each do |t2|
                if t1['weekday'] == t2['weekday']
                    start_t = [t1['start_time'], t2['start_time']].sort
                    start_t[0] = start_t[0].split(":")
                    start_t[1] = start_t[1].split(":")
                    end_t = [t1['end_time'], t2['end_time']].sort
                    end_t[0] = end_t[0].split(":")
                    end_t[1] = end_t[1].split(":")
                    if (end_t[0][0].to_i * 60 + end_t[0][1].to_i) - (start_t[1][0].to_i * 60 + start_t[1][1].to_i) >= 60
                        possible = true
                    end
                end
            end
        end
        return possible
    end

    def sort
        # Sort tutors table by # of matches
        @sorted_tutors.sort_by{ |tutor| tutor['number_of_matches'] }
        # Sort the possible matches by ascending number of matches for each tutor
        @possible_matches.keys.each do |tutor_id|
            @possible_matches[tutor_id].sort_by{ |tutee| tutee['number_of_matches'] }
        end
    end

    def final_match
        # for each tutor, (sorted in order from least to most number of possible matches)
        @sorted_tutors.each do |sorted_tutor|
        # we go through its possible matches (also sorted in order from least to most number of possible matches)
            if @possible_matches[sorted_tutor['id']].nil?
                puts "no"
            else
                puts "yes"
                @possible_matches[sorted_tutor['id']].each do |tutee|
                    # if the tutee is matched then we skip over it, otherwise we match it with the tutor
                    if tutee['matched'] == false && sorted_tutor['matched'] == false
                        Tutor.find(id = sorted_tutor['id']).update_attributes(:matched => true)
                        tutee['matched'] = true
                        sorted_tutor['matched'] = true
                        client_type = ""
                        if tutee.class == "Parent"
                            client_type = "p"
                            Parent.find(id = tutee['id']).update_attributes(:matched => true)
                        else
                            Teacher.find(id = tutee['id']).update_attributes(:matched => true)
                            client_type = "t"
                        end
                        Match.create(:tutor_id => sorted_tutor['id'], :tutee_id => client_type + tutee['id'].to_s)
                    end
                end
            end
        end
    end
end
