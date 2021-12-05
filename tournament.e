class
	TOURNAMENT
create
	make

feature
	make
		do
			runs:=0
			create agents.make_empty
		end


	runs:INTEGER
	agents:ARRAY [ABSTRACT_AGENT]


	compete (a,b:ABSTRACT_AGENT) --true:cooperate, false:defect
		local
			i:INTEGER
			next_move_a:BOOLEAN
			next_move_b:BOOLEAN
			points_a_local:INTEGER
			points_b_local:INTEGER
		do
			points_a_local:=0
			points_b_local:=0
			print("  " + a.name + " VS " + b.name)
			print("%N  ------+------%N")

			from
				i:=0
			until
				i=runs
			loop
				i:=i+1
				next_move_a:=a.next
				next_move_b:=b.next

				if next_move_a and next_move_b		       	--a&b cooperate
				then
					a.set_points(a.get_points-2) --global points for a
					b.set_points(b.get_points-2)

					points_a_local:=points_a_local-2           --local points just for this round
					points_b_local:=points_b_local-2
					print("  C  -2 | C  -2%N")

				elseif not next_move_a and next_move_b  	--a defects
				then
					a.set_points(a.get_points-1)
					b.set_points(b.get_points-6)

					points_a_local:=points_a_local-1
					points_b_local:=points_b_local-6
					print("  D  -1 | C  -6%N")

				elseif not next_move_b and next_move_a 		 --b defects
				then
					a.set_points(a.get_points-6)
					b.set_points(b.get_points-1)

					points_a_local:=points_a_local-6
					points_b_local:=points_b_local-1

					print("  C  -6 | D  -1%N")

				elseif not next_move_b and not next_move_a  --a&b defect
				then
					a.set_points(a.get_points-4)
					b.set_points(b.get_points-4)

					points_a_local:=points_a_local-4
					points_b_local:=points_b_local-4

					print("  D  -4 | D  -4%N")
				end --end if

					a.result_of_other (next_move_b) --set results of other for both participants for next round
					b.result_of_other (next_move_a)

			end --end loop
				print("  ------+------%N  ") --print points for both
				print(points_a_local)
				print("       ")
				print(points_b_local)
				print("  %N%N")
		end--end compete



	run
		local
			agent_always_coop:AGENT_ALLC
			agent_always_defect:AGENT_ALLD
			agent_grim:AGENT_GRIM
			agent_random:AGENT_RAND
			agent_tft:AGENT_TFT
		do
			create agent_always_coop.make
			create agent_always_defect.make
			create agent_grim.make
			create agent_random.make
			create agent_tft.make

			agents.make_filled (agent_tft, 1,5) --fill with tft as dummy agent to get correct size

			agents.put (agent_always_coop, 1)
			agents.put (agent_always_defect, 2)
			agents.put (agent_grim, 3)
			agents.put (agent_random, 4)
			agents.put (agent_tft, 5)


			compete(agents[1],agents[2]) --always coop vs always defect
			compete(agents[1],agents[3]) --always coop vs grim
			compete(agents[1],agents[4]) --always coop vs random
			compete(agents[1],agents[5]) --always coop vs tft

			compete(agents[2],agents[3]) --always defect vs grim
			compete(agents[2],agents[4]) --always defect vs random
			compete(agents[2],agents[5]) --always defect vs tft

			compete(agents[3],agents[4]) --grim vs random
			compete(agents[3],agents[5]) --grim vs tft

			compete(agents[4],agents[5]) --tft vs random

		end--end run

	print_and_sort_agents
		local
			tmp_agent:ABSTRACT_AGENT
			i:INTEGER
			j:INTEGER
			k:INTEGER
		do
			from	--sort agents by points (bubblesort)
				i:=1
			until
				i = 5
			loop
				from
					j:=1
				until
					j = 5
				loop
					if
						agents[j].points > agents[j+1].points
					then
						tmp_agent:=agents[j]
						agents[j]:= agents[j+1]
						agents[j+1]:=tmp_agent
					end --end if
					j:=j+1
				end	--end j loop
				i:=i+1
			end --end i loop


			from --print sorted agents (5 4 3 2 1 -> negative points)
				k:=5
			until
				k=0
			loop
				print("  " + agents[k].name + ":  ")
				print(agents[k].points)
				print("%N")
				k:=k-1
			end --end k loop
		end


	main (n:INTEGER)

		do
			runs:=n
			run --starts agents battle
			print_and_sort_agents
		end--end main

end --end TOURNAMENT
