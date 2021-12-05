note
	description: "Cooperates first, then copies opponents last move"

class
	AGENT_TFT

inherit
	ABSTRACT_AGENT

create
	make

feature --constructor
	make
		do
			points:=0
			other_decision:=TRUE
			name:="AGENT_TFT"
		end


feature -- Agent strategy next move
	next:BOOLEAN
		do
			if other_decision then
				Result:=TRUE
			else
				Result:=FALSE
			end
		end
end
