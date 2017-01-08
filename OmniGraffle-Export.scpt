set strOutputDirectory to choose folder

tell application id "OGfl"
	set objOmniGraffleFile to front document
	
	set _path to path of objOmniGraffleFile
	
	-- Get filename without extension
	tell application "Finder"
		set {_filename, _extension, _ishidden} to the ¬
			{displayed name, name extension, extension hidden} ¬
				of ((the _path as POSIX file) as alias)
	end tell
	if (_extension ≠ missing value) then
		set baseName to texts 1 thru -((length of _extension) + 2) of _filename
	end if
	
	
	--File name will be the file name of the file with a hyphen and then the name of the canvas
	--Files saved in PNG format
	set currentCanvas to canvas of front window
	set strOutputFilePath to strOutputDirectory & baseName & " - " & name of currentCanvas & ".png" as string
	set area type of current export settings to current canvas
	save objOmniGraffleFile as "png" in file (strOutputFilePath)
end tell
