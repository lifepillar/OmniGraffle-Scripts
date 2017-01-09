-- Export current OmniGraffle Document to a Visio VDX format,
-- include date stamp in the file name as the generated file is a derivative (not source)
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
	
	-- Add 2017-01-30 Datestamp to export
	set {year:yr, month:mt, day:dy} to (current date)
	set mt to texts -2 thru -1 of ("00" & (mt as integer))
	set dy to texts -2 thru -1 of ("00" & dy)
	set date_string to "-" & yr & "-" & mt & "-" & dy
	
	--File name will be the file name of the current file + datestamp .vdx
	set currentCanvas to canvas of front window
	set strOutputFilePath to strOutputDirectory & baseName & date_string & ".vdx" as string
	set area type of current export settings to current canvas
	save objOmniGraffleFile as "vdx" in file (strOutputFilePath)
end tell
