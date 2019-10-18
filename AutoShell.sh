#!/bin/bash
#
#             88                     88 88
#             88                     88 88
#             88                     88 88
#   ,adPPYba, 88,dPPYba,   ,adPPYba, 88 88
#   I8[    "" 88P'    "8a a8P_____88 88 88
#    `"Y8ba,  88       88 8PP""""""" 88 88
#   aa    ]8I 88       88 "8b,   ,aa 88 88
#   `"YbbdP"' 88       88  `"Ybbd8"' 88 88
#
#
#
# Requires inotify-tools package
#
# Author oddstap
#
# This simple tool takes newly created files in the Downloads directory
# and then organizes them based on file extension.
# The way i have it set up is Document type files txt,docx,

TARGET=~/Downloads
USER=$(whoami)

inotifywait -m -e create -e moved_to --format "%f" $TARGET \
        | while read FILENAME
                do
			# Word processor and text file formats by file extension
			if [ ${FILENAME: -4} == ".doc" ] || [ ${FILENAME: -5} == ".docx" ] || [ ${FILENAME: -4} == ".odt" ] || [ ${FILENAME: -4} == ".pdf" ] \
				|| [ ${FILENAME: -4} == ".rtf" ] || [ ${FILENAME: -4} == ".tex" ] || [ ${FILENAME: -4} == ".txt" ] || [ ${FILENAME: -4} == ".wks" ] \
				|| [ ${FILENAME: -4} == ".wps" ] || [ ${FILENAME: -4} == ".wpd" ]
			then
				mkdir -p ~/Documents/Word_Processor_And_Text_files
				mv "$TARGET/$FILENAME" "/home/$USER/Word_Processor_And_Text_files"



			# Audio file formats by file extensions
		        elif [ ${FILENAME: -4} == ".mp3" ] || [ ${FILENAME: -4} == ".wav" ] || [ ${FILENAME: -4} == ".wma" ] || [ ${FILENAME: -4} == ".mid" ] \
				|| [ ${FILENAME: -5} == ".midi" ] || [ ${FILENAME: -4} == ".aif" ] || [ ${FILENAME: -4} == ".cda" ] || [ ${FILENAME: -4} == ".mpa" ] \
				|| [ ${FILENAME: -4} == ".ogg" ] || [ ${FILENAME: -4} == ".wpl" ]
			then
				mv "$TARGET/$FILENAME" "/home/$USER/Music"


			# Image file formats by file extension
			elif [ ${FILENAME: -4} == ".jpg" ] || [ ${FILENAME: -5} == ".jpeg" ] || [ ${FILENAME: -4} == ".png" ] || [ ${FILENAME: -3} == ".ai" ] \
				|| [ ${FILENAME: -4} == ".bmp" ] || [ ${FILENAME: -4} == ".gif" ] || [ ${FILENAME: -4} == ".ico" ] || [ ${FILENAME: -3} == ".ps" ] \
				|| [ ${FILENAME: -4} == ".svg" ] || [ ${FILENAME: -4} == ".tif" ] [ ${FILENAME: -5} == ".tiff" ] || [ ${FILENAME: -4} == ".psd" ]
			then
				mv "$TARGET/$FILENAME" "/home/$USER/Pictures"


			# Video file formats by file extension
			elif [ ${FILENAME: -4} == ".avi" ] || [ ${FILENAME: -4} == ".wmv" ] || [ ${FILENAME: -4} == ".3g2" ] || [ ${FILENAME: -4} == ".3gp" ] \
				|| [ ${FILENAME: -4} == ".flv" ] || [ ${FILENAME: -5} == ".h264" ] || [ ${FILENAME: -4} == ".m4v" ] || [ ${FILENAME: -4} == ".mkv" ] \
				|| [ ${FILENAME: -4} == ".mov" ] || [ ${FILENAME: -4} == ".mp4" ] || [ ${FILENAME: -4} == ".mpg" ] || [ ${FILENAME: -5} == ".mpeg" ] \
				|| [ ${FILENAME: -3} == ".rm" ] || [ ${FILENAME: -4} == ".swf" ] || [ ${FILENAME: -4} == ".vob" ] || [ ${FILENAME: -4} == ".wmv" ]
			then
				mv "$TARGET/$FILENAME" "/home/$USER/Videos"

			# Compressed file extensions
			elif [ ${FILENAME: -3} == ".7z" ] || [ ${FILENAME: -4} == ".arj" ] || [ ${FILENAME: -4} == ".deb" ] || [ ${FILENAME: -4} == ".pkg" ] \
				|| [ ${FILENAME: -4} == ".rar" ] || [ ${FILENAME: -4} == ".rpm" ] || [ ${FILENAME: -7} == ".tar.gz" ] || [ ${FILENAME: -2} == ".z" ] \
				|| [ ${FILENAME: -4} == ".zip" ]
			then
				mkdir -p ~/Documents/Compressed_Files
				mv "$TARGET/$FILENAME" "/home/$USER/Documents/Compressed_Files"


			# Disc and media file extensions
			elif [ ${FILENAME: -4} == ".bin" ] || [ ${FILENAME: -4} == ".dmg" ] || [ ${FILENAME: -4} == ".iso" ] || [ ${FILENAME: -4} == ".toast" ] \
				|| [ ${FILENAME: -3} == ".vcd" ]
			then
				mkdir -p ~/Documents/Disk_Images
				mv "$TARGET/$FILENAME" "/home/$USER/Documents/Disk_Images"

			# Data and database file extensions
			elif [ ${FILENAME: -4} == ".csv" ] || [ ${FILENAME: -4} == ".dat" ] || [ ${FILENAME: -3} == ".db" ] || [ ${FILENAME: -4} == ".dbf" ] \
				|| [ ${FILENAME: -4} == ".log" ] \
				|| [ ${FILENAME: -4} == ".mdb" ] || [ ${FILENAME: -4} == ".sav" ] || [ ${FILENAME: -4} == ".sql" ] || [ ${FILENAME: -4} == ".tar" ] \
				|| [ ${FILENAME: -4} == ".xml" ]
			then
				mkdir -p ~/Documents/Data_Database
				mv "$TARGET/$FILENAME" "/home/$USER/Documents/Data_Database"


			# Executable file extensions
			elif [ ${FILENAME: -4} == ".apk" ] || [ ${FILENAME: -4} == ".bat" ] || [ ${FILENAME: -4} == ".cgi" ] || [ ${FILENAME: -3} == ".pl" ] \
				|| [ ${FILENAME: -4} == ".com" ] || [ ${FILENAME: -4} == ".exe" ] || [ ${FILENAME: -4} == ".gadget" ] || [ ${FILENAME: -4} == ".jar" ] \
				|| [ ${FILENAME: -3} == ".py" ] || [ ${FILENAME: -4} == ".wsf" ]
			then
				mkdir -p ~/Documents/Executable_File
				mv "$TARGET/$FILENAME" "/home/$USER/Documents/Executable_File"


			# Font file extensions
			elif [ ${FILENAME: -4} == ".fnt" ] || [ ${FILENAME: -4} == ".fon" ] || [ ${FILENAME: -4} == ".otf" ] || [ ${FILENAME: -4} == ".ttf" ]
			then
				mkdir -p ~Documents/Fonts
				mv "$TARGET/$FILENAME" "/home/$USER/Documents/Fonts"

			# Internet related file extensions
			elif [ ${FILENAME: -4} == ".asp" ] || [ ${FILENAME: -4} == ".cer" ] || [ ${FILENAME: -4} == ".cfm" ] || [ ${FILENAME: -4} == ".css" ] \
				|| [ ${FILENAME: -4} == ".htm" ] || [ ${FILENAME: -5} == ".html" ] || [ ${FILENAME: -3} == ".js" ] || [ ${FILENAME: -4} == ".jsp" ] \
				|| [ ${FILENAME: -5} == ".part" ] || [ ${FILENAME: -4} == ".php" ] || [ ${FILENAME: -4} == ".rss" ] || [ ${FILENAME: -4} == ".xhtml" ]
			then
				mkdir -p ~/Documents/Internet_files
				mv "$TARGET/$FILENAME" "/home/$USER/Documents/Internet_files"

			# Presentation file formats by file extension
			elif [ ${FILENAME: -4} == ".key" ] || [ ${FILENAME: -4} == ".odp" ] || [ ${FILENAME: -4} == ".pps" ] || [ ${FILENAME: -4} == ".ppt" ] || [ ${FILENAME: -5} == ".pptx" ]
			then
				mkdir -p ~/Documents/Presentation_files
				mv "$TARGET/$FILENAME" "/home/$USER/Documents/Presentation"

			# Programming files by file extensions
			elif [ ${FILENAME: -2} == ".c" ] || [ ${FILENAME: -6} == ".class" ] || [ ${FILENAME: -4} == ".cpp" ] || [ ${FILENAME: -3} == ".cs" ] || [ ${FILENAME: -2} == ".h" ] \
				|| [ ${FILENAME: -5} == ".java" ] || [ ${FILENAME: -3} == ".sh" ] || [ ${FILENAME: -6} == ".swift" ] || [ ${FILENAME: -3} == ".vb" ]
			then
				mkdir -p ~/Documents/Programming_Files
				mv "$TARGET/$FILENAME" "/home/$USER/Documents/Programming_Files"


			# Spreadsheet file formats by file extension
			elif [ ${FILENAME: -4} == ".ods" ] || [ ${FILENAME: -4} == ".xlr" ] || [ ${FILENAME: -4} == ".xls" ] || [ ${FILENAME: -5} == ".xlsx" ]
			then
				mkdir -p ~/Documents/Spreadsheets
				mv "$TARGET/$FILENAME" "/home/$USER/Documents/Spreadsheets"



			# Misc
			#else
				# This lists all the extensions in the directory then makes directories with the output
				#find . -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u | xargs mkdir -p
				# Move corresponding files into folders?
			fi


		done
