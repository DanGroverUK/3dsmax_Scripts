--Created by Dan Grover. Please email any bugs to dan-grover@dan-grover.com
-- Last Updated: 4th October, 2012
Rollout MyRoll "Fake Wind"
(
	group "Wind Settings"
	(
		checkbox fractal "Violence On - Off"
		spinner speeder "Speed" range:[0.00,1,0.01]
		spinner strength "Strength" range:[0,500,50]
		spinner easeinout "Ease In/Out" range:[0,500,10]
	)
	
	button generate "Generate Wind"
	button clearwind "Clear Wind"
	edittext info text:"Waiting..."
	
	on clearwind pressed do
	(
		objlist = selection as array
		for b in 1 to objlist.count do
		(
			for c in objlist[b].modifiers.count to 1 by -1 do
			(
				if objlist[b].modifiers[c].name == "Bend" do
				(
					info.text = ("Deleting from " + (objlist[b].name as string))
					windows.processPostedMessages()
					deletemodifier objlist[b] c
				)
			)
		)
		info.text = "Waiting..."
		windows.processPostedMessages()
	)
	
	on generate pressed do
	(
		disablesceneredraw()
		setCommandPanelTaskMode #modify
		seeder = 0
		benders = selection as array
		for a in 1 to benders.count do
		(
			seeder = seeder + 1
			select benders[a]
			modPanel.addModToSelection (Bend ()) ui:on
			$.modifiers[#Bend].BendAngle.controller = Noise_float seed:seeder positive:true frequency:(speeder.value) fractal:fractal.checked rampin:(easeinout.value) rampout:(easeinout.value) noise_strength:(strength.value) name:"Wind"
			info.text = ("Adding Wind to " + ($.name as string))
			windows.processPostedMessages()
		)
	info.text = "Redrawing Screen"
	windows.processPostedMessages()
	enablesceneredraw()
	redrawViews()
	info.text = "Waiting..."
	windows.processPostedMessages()
	)
		
)--end rollout
  createdialog MyRoll height:190 width:310