rollout MyRoll "Change Proxy Visibility"
  (
			radiobuttons rad_buttons "Proxy Display:" labels:# ("Box", "Edges", "Dots", "Faces") columns: 2
			button alter "Change Proxies" align:#left width:120
			label lab1 "Choose the Proxy Display" align:#middle
			label lab2 "and hit the Button" align:#middle

  			  on alter pressed do 
				(
					for b in objects where classof b == VRayProxy do
					(
						val = ((rad_buttons.state) - 1)
						b.display = val
					)
				)--end pressed

  )--end rollout
  createdialog MyRoll height:120 width:150	

	