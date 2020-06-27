--Created by Dan Grover. Please email any bugs to dan-grover@dan-grover.com
-- Last Updated: 13th May, 2012
Rollout MyRoll "Batch Tool"
  (
	button dobatch "Fill Batch" width:120
	button deletecurrent "Delete Current Batch" width:120
	button broken "Not Working?" width:120
	  
	on broken pressed do
	(
		messagebox "Close the Batch Render dialogue and re-open it! It won't refresh, but it WILL be changing!"
	)
	  
	on dobatch pressed do
	(
		renderSceneDialog.open()
		renderscenedialog.commit()
		
		currentview = undefined
		camlist = #()
		for a in cameras do
			(
				if classof a == targetcamera do
				(
					join camlist a
				)
				if classof a == freecamera do
				(
					join camlist a
				)
			)	
		for b in 1 to camlist.count do
			(
				currentview = batchrendermgr.createview camlist[b]
				currentview.name = (camlist[b].name)
				currentview.outputfilename = ((getFileNamePath rendOutputFilename) + camlist[b].name + "_" + (filenamefrompath rendoutputfilename))
			)
		)
		
	on deletecurrent pressed do
	(
		totalnum = batchrendermgr.numviews
		for c in 1 to totalnum do
		(
			print c
			batchrendermgr.deleteview 1
		)
	)
		
	)--end rollout
createdialog MyRoll height:85 width:150
	