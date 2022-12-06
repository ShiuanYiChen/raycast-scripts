#!/usr/bin/osascript

# @raycast.title Airpods ANC
# @raycast.author Shiuan Yi Chen
# @raycast.authorURL https://github.com/ShiuanYiChen
# @raycast.description Airpods ANC Toggle.
# @raycast.icon ??

# @raycast.mode silent
# @raycast.packageName System
# @raycast.schemaVersion 1

-- Set your Airpods Name. e.g. "Alex's Airpods Pro"
set AirPodsName to ""

set ControlCenterWindow to "Control Center"

tell application "System Events"
	tell process "ControlCenter"
		click menu bar item "Sound" of menu bar 1
		set outputsList to scroll area of window ControlCenterWindow
		set airpodsToggle to checkbox 1 of scroll area 1 of window ControlCenterWindow whose title contains AirPodsName
		set airpodsToggleValue to value of airpodsToggle
		tell airpodsToggle to click
		delay 0.1
		set airpodsANC to checkbox 1 of scroll area 1 of window ControlCenterWindow whose title contains "Noise Cancellation"

		if exists airpodsANC then
			if value of airpodsANC is 1 then
				set airpodsTransparency to checkbox 1 of scroll area 1 of window ControlCenterWindow whose title contains "Transparency"
				tell airpodsTransparency to click
				do shell script "echo Transparency"
			else
				tell airpodsANC to click
				do shell script "echo Noise Cancellation"
			end if
		end if

	end tell
end tell
