note
	description: "Agent cooperates until opponent defects, then always defects"

class
	AGENT_GRIM

inherit
	ABSTRACT_AGENT

create
	make

feature --constructor
	make
		do
			points:=0
			other_decision:=TRUE
			name:="AGENT_GRIM"
		end


feature
	-- saves whether or not Opponent defected at least once
	opp_defected:BOOLEAN



feature -- checks if Opponent defected at least once
	opp_defects
			do
				if not other_decision then
					opp_defected:=TRUE
				end
			end

feature -- implements Agent strategy next move
	next:BOOLEAN
		do
			if opp_defected then
				Result:=FALSE
			else
				Result:=TRUE
			end
		end
end
