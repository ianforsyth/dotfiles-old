tell application "iTerm"
	set prpWindow to current window
	tell prpWindow
		set serverPane to the current session
		
		tell serverPane
			write text "papi"
			write text "spring rails s -p 3001"
			
			delay 1
			
			set nodePane to (split vertically with default profile)
			set blankServerPane to (split horizontally with default profile)
			set ngrokPane to (split vertically with default profile)
		end tell
		
		tell ngrokPane
			write text "~/ngrok http 3001"
		end tell
		
		tell nodePane
			write text "papp"
			write text "npm start"
			
			set blankNodePane to (split horizontally with default profile)
		end tell
		
		tell blankNodePane
			write text "papp"
		end tell
	end tell
	
	set vimWindow to (create window with default profile)
	tell vimWindow
		set appPane to the current session
		tell appPane
			write text "papp"
			write text "vim ."
		end tell
		
		create tab with default profile
		set apiPane to the current session
		tell apiPane
			write text "papi"
			write text "vim ."
		end tell
	end tell
	
end tell
