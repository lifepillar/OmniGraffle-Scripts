-- Export all Canvases with unique names
-- modified from https://discourse.omnigroup.com/t/script-to-export-a-portion-of-all-canvases-and-save-a-series-of-pngs/7163
set strOutputDirectory to choose folder

tell application id "OGfl"
	set objOmniGraffleFile to front document
	set canvas of front window to canvas 1 of objOmniGraffleFile
	set intCanvasCount to count of canvases of objOmniGraffleFile
	--set name to "test"
	-- name of objOmniGraffleFile
	set theNumber to 1
	
	-- Get filename without extension (sets baseName)
	set _path to path of objOmniGraffleFile
	tell application "Finder"
		set {_filename, _extension, _ishidden} to the ¬
			{displayed name, name extension, extension hidden} ¬
				of ((the _path as POSIX file) as alias)
	end tell
	if (_extension ≠ missing value) then
		set baseName to texts 1 thru -((length of _extension) + 2) of _filename
	end if
	
	
	--Iterate through each canvas and export it to the specified folder
	--File name will be the file name of the file with a hyphen and then the name of the canvas
	--Files saved in PNG format
	repeat with intCurrentCanvasID from 1 to intCanvasCount
		set canvas of front window to canvas intCurrentCanvasID of objOmniGraffleFile
		set currentCanvas to canvas of front window
		set strOutputFilePath to strOutputDirectory & baseName & " - " & name of currentCanvas & ".png" as string
		set area type of current export settings to current canvas
		save objOmniGraffleFile as "png" in file (strOutputFilePath)
		set theNumber to theNumber + 1
	end repeat
end tell

--Display a final message about the exports
display dialog "Exported " & intCanvasCount & " files to " & strOutputDirectory with title "Export Complete"
