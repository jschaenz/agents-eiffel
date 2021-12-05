note
	description: "Agent always cooperates"

class
	AGENT_ALLC

inherit
	ABSTRACT_AGENT

create
	make

feature --constructor
	make
		do
			points:=0
			other_decision:=TRUE
			name:="AGENT_ALLC"
		end

feature --Agent strategy next move
	next:BOOLEAN
		do
			Result:=TRUE
		end
end
