(
	function glassMaterial = 
	(
		--Create a realistic glass material to assign to each editable mesh
		--source here: http://www.3dvalley.com/tutorials/creating-realistic-glass-material-in-3ds-max/
		meditMaterials[1]  = standardMaterial()
		meditMaterials[1].ambient = color 0 0 0
		meditMaterials[1].Diffuse = color 0 0 0
		meditMaterials[1].specularLevel = 275
		meditMaterials[1].glossiness = 45
		meditMaterials[1].opacityMap = falloff ()
		meditMaterials[1].refractionMapEnable = on
		meditMaterials[1].refractionMap = Raytrace ()
		meditMaterials[1].refractionMapAmount = 80
		meditMaterials[1].samplerUseGlobal = off
		meditMaterials[1].samplerEnable = on
	)
	glassMaterial()
)