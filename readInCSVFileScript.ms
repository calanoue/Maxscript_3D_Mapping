(
local x = False, fName, theFile, lastName = "None"
local theShape = line name:"imported"
   
function renameShape =
(
	--Rename shapes to the lastName variable
	
	select $imported
	$.name = lastName
)	
	
fName = getOpenFileName caption:"Select a .csv file to import" filename:"*.csv" types:"csv|*.csv"
if fName != undefined then
   (
	theFile = openFile fName mode:"r" --open file that the user selected, if not undefined
	seek theFile #eof --seek to end of file
	maxlen = filePos theFile --count of file rows
	seek theFile (maxlen - 1) --seek to last row with data
	lf = filterString (readLine theFile) "," --data from last row
	finalName = lf[1] as string --get final name from last row
	seek theFile 0 --seek back to the start and begin loop
	while not eof theFile do --do until end of file
      (
		lf = filterString (readLine theFile) "," --read in data on next line
		n = lf[1] as string --save coordinate set name as string
		if n != lastName and not x then --on first line of file
		( 
			addNewSpline theShape --add a new spline and name it 'imported' to start
			lastName = n --change lastName variable to the current coordinate set name
			x = True --boolean to show off first line
		)
		if n != lastName and x then
		(
			close theShape 1 --close the spline
			updateShape theShape --update the spline shape
			renameShape() --rename current shape to lastName
			if lastName != finalName then --if last coordinate set name is reached don't add new shape
			(
				theShape = line name:"imported" --add a new shape named 'imported'
				addNewSpline theShape --make the shape a spline
			)
			lastName = n
		)
		addKnot theShape 1 #smooth #line [lf[2] as float, lf[3] as float, 0] --z is always 0 in these cases because the image to begin with is 2D
      )
	close theShape 1 --close final shape
	updateShape theShape --update final shape
	renameShape() --rename current shape to lastName
	close theFile --close the CSV file
   )
)