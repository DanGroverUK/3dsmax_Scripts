rollout MyRoll "Ani-Offset Fix - Dan"
  (
			spinner whatkey "Which Key?" range: [0,1000000,2] type:#integer align:#middle width:120
			spinner offsetamount "Offset Frames?" range: [0,100,2] type:#integer align:#middle width:120
			button offset "Offset Position" align:#middle width:120
			label lab1 "Choose the Offset Amount" align:#middle
			label lab2 "and hit the Button" align:#middle

  			  on offset pressed do 
				(
					offsetval = offsetamount.value
					counter = 0
					for c in selection do
						(
							c.pos.controller = bezier_position ()
							if numkeys c.pos.controller > (whatkey.value -1) do
								(
									moveKey c.pos.controller (whatkey.value) offsetval
									print c
								)
						)		
				)--end pressed

  )--end rollout
  createdialog MyRoll height:110 width:200
  
