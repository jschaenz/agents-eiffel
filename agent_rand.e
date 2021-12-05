note
	description: "Agent with actions chosen at random"

class
	AGENT_RAND

inherit
	ABSTRACT_AGENT

create
	make

feature --constructor
	make
		local --https://www.eiffel.org/article/random_numbers
      		l_time: TIME
      		l_seed: INTEGER
    		do
       			  -- This computes milliseconds since midnight.
      		create l_time.make_now
      	 	l_seed := l_time.hour
     		l_seed := l_seed * 60 + l_time.minute
     		l_seed := l_seed * 60 + l_time.second
      		l_seed := l_seed * 1000 + l_time.milli_second

     		create random_sequence.set_seed (l_seed)
			points:=0
			other_decision:=TRUE
			name:="AGENT_RAND"
		end



feature --random number to determine next move

	random_sequence: RANDOM

	new_random: INTEGER
		do
			random_sequence.forth
			Result := random_sequence.item
		end

	random_number: INTEGER
		do
			Result := new_random \\ 2 + 1
		end

feature -- Agent strategy next move
	next:BOOLEAN
		do
			if random_number = 1 then
				Result:=TRUE
			else
				Result:=FALSE
			end
		end

end
