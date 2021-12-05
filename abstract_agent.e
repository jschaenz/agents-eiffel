deferred class
	ABSTRACT_AGENT

feature

	points:INTEGER
	other_decision:BOOLEAN
	name:STRING

	next:BOOLEAN --specific decision making of each Agent implemented in AgentX Class
		deferred
		end

	set_points(n:INTEGER)
		do
			points:=n
		end

	get_points:INTEGER
		do
			Result:=points
		end

	result_of_other (other:BOOLEAN)
		do
			other_decision := other
		end
end
