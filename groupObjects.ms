(
	local group_names = #()

	-- Find all the non "_" shape names
	for obj in objects do (
		if not matchPattern obj.name pattern:"*_*" then (
			append group_names obj.name
		)
	)

 	--Create collections of objects for which to group
 	for group_name in group_names do (
 		current_group= for obj in objects where matchpattern obj.name pattern:(group_name + "_*") or obj.name==group_name collect obj
		main_obj = getnodebyname group_name -- Get object behind the group_name variable
 		main_color = main_obj.wirecolor -- Color of the main object in the group
 		for obj in current_group do (
 			obj.wirecolor = main_color -- Make each object in the group the same color
 		)
 		group current_group name:(group_name + "_SHP") -- Group shape names that have same prefix
 	)
 	for obj in objects do (
 		selectMore obj
 	)
)