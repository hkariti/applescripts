repeat
	set returned to display dialog "Enter project name" default answer "" with icon note buttons {"Cancel", "Continue"} default button "Continue"
	set projectName to text returned of returned
	if projectName is not equal to "" then exit repeat
end repeat
tell application "Evernote"
	if tag named projectName exists then
		tell current application to display dialog "exists"
	else
		set parentTag to tag named "projects"
		set projectTag to make tag with properties {name:projectName, parent:parentTag}
		set parent of projectTag to parentTag
		set projectNote to create note title projectName notebook "H1: Projects" with text " "
		assign projectTag to projectNote
		open note window with projectNote
		activate
	end if
end tell
