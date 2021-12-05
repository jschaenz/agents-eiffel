class
	MAIN

inherit
	ARGUMENTS_32

create
	make

feature -- Initialization

	make
		local
			T:TOURNAMENT

		do --main()

			create T.make
			T.main(7)
		end

end --end MAIN
