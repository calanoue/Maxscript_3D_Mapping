(
	function applyModifiers =
	(
		--Apply modifiers to the irregular polygon shapes from a Tiger line census shapefile.
		
		modPanel.addModToSelection ( extrude amount:.1 segs:2 capStart:true capEnd:true capType:1 output:1 matIDs:false mapCoords:true realWorldMapSize:true )
-- 		modPanel.addModToSelection ( Quadify_Mesh quadsize:4.0 ui:on )
-- 		modPanel.addModToSelection ( turbosmooth ui:on )
	)

-- 	for obj in objects do (
-- 		selectmore obj
-- 	)

	applyModifiers()
)