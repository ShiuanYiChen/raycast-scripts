#!/usr/bin/osascript

# @raycast.title Airpods ANC
# @raycast.author Shiuan Yi Chen
# @raycast.authorURL https://github.com/ShiuanYiChen
# @raycast.description Airpods ANC Toggle.

# @raycast.mode silent
# @raycast.schemaVersion 1

-- Set your Airpods Name. e.g. "Alex's Airpods Pro"
set AirPodsName to ""

tell application "System Events"
	tell application process "ControlCenter"
		set volMenu to menu bar item "Sound" of menu bar 1
		tell volMenu to click
		set controlWindow to window "Control Center"
		set outputsList to scroll area of controlWindow
		set airpodsToggle to checkbox 1 of scroll area 1 of window "Control Center" whose title contains AirPodsName
		set airpodsToggleValue to value of airpodsToggle
		tell airpodsToggle to click
		delay 0.1
		set airpodsANC to checkbox 1 of scroll area 1 of window "Control Center" whose title contains "Noise Cancellation"
		if exists airpodsANC then
			if value of airpodsANC is 1 then
				set airpodsTransparency to checkbox 1 of scroll area 1 of window "Control Center" whose title contains "Transparency"
				tell airpodsTransparency to click
			else
				tell airpodsANC to click
			end if
		end if
		tell volMenu to click
	end tell
end tell