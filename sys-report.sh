#! /bin/bash

#Filename for the report
REPORT_FILE="system_report.txt"

EMAIL="example@gmail.com"
CC="example@gmail.com"
#Create or clear the report file 
echo "Generating system report......" >"$REPORT_FILE"
echo ".............................." >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

##CPU Information
echo "CPU info: $(lscpu | grep 'Model name' | awk -F ':' '{ print $2 }' | xargs)" >> "$REPORT_FILE"

#Memory Usage
echo "Memory usage:" >> "$REPORT_FILE" 
free -h >> "$REPORT_FILE"

#Disk Usage
echo :"Disk Usage: " >> "$REPORT_FILE"
df -h >> "$REPORT_FILE"

#Finish report
echo "" >> "REPORT_FILE"
echo "Report generated on: $(date)" >> "$REPORT_FILE"

#Print report file location
echo "System report saved to: $REPORT_FILE"

#Send the report as an email attachment
if command -v mail &> /dev/null; then

echo "Hello G3W, please find the attached system report. Regards, Mary." | mail -s "Daily System Report" -A  "$REPORT_FILE" "$EMAIL" "$CC"
 echo "Email sent to: $EMAIL $CC"
else
 echo "Error: 'Mail' command not found. please install mailutils or mailx"
fi
