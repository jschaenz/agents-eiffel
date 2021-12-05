note
	description: "Agent always defects."

class
	AGENT_ALLD

inherit
	ABSTRACT_AGENT

create
	make

feature --constructor
	make
		do
			points:=0
			other_decision:=TRUE
			name:="AGENT_ALLD"
		end

feature --Agent strategy next move
	next:BOOLEAN
		do
			Result:=FALSE
		end

end
