tell application "Things" 

set delimiter to "	" 
set wrapper to "\"" 
set newItem to return 

set plainTextFile to choose file name with prompt "Choose target text file..." 
if plainTextFile is "" then 
return 
end if 

try 
open for access plainTextFile with write permission 
on error 
display dialog "Cannot open file for writing!" 
return 
end try 

set selectedToDos to selected to dos 

repeat with projectToDo in selectedToDos 

try 

set proj to project id (id of projectToDo) 

on error 
display dialog "Could not get project to export" 
exit repeat 
end try 


write ("Name" & delimiter & "Project" & delimiter & "Due" & delimiter & "Notes" & delimiter & "Tags" & newItem) as text to plainTextFile 

set projName to name of proj 
write projName as text to plainTextFile 
write (newItem & "---------------" & newItem) as text to plainTextFile 

set i to 1 



repeat with toDo in to dos of proj 

set toDoName to name of toDo 
set toDoNotes to notes of toDo 
set toDoDue to due date of toDo 
set toDoTags to tag names of toDo 



if toDoName is not missing value then write (wrapper & toDoName & wrapper) as text to plainTextFile 

write (delimiter) as text to plainTextFile 

if projName is not missing value then write (wrapper & projName & wrapper) as text to plainTextFile 

write (delimiter) as text to plainTextFile 

if toDoDue is not missing value then write (wrapper & toDoDue & wrapper) as text to plainTextFile 

write (delimiter) as text to plainTextFile 

if toDoNotes is not missing value then write (wrapper & toDoNotes & wrapper) as text to plainTextFile 

write (delimiter) as text to plainTextFile 

if toDoTags is not missing value then write (wrapper & toDoTags & wrapper) as text to plainTextFile 

write (newItem) as text to plainTextFile 

end repeat 


write (newItem & newItem) as text to plainTextFile 

end repeat 


close access plainTextFile 


end tell