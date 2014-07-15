set listContents to get the clipboard
set delimitedList to paragraphs of listContents

tell application "Things"
	repeat with currentTodo in reverse of delimitedList
		set newToDo to make new to do ¬
			with properties {name:currentTodo} ¬
			at beginning of list "Inbox"
		-- perform some other operations using newToDo
	end repeat
end tell
