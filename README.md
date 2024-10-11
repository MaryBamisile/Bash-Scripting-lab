# Bash-Scripting-lab
<H3>Objective of this lab:

<li>Write a bash script that generates a system report.
<li>Set up a cron job to run this script periodically (e.g., daily).
<li>Add functionality to send the report via email.
<li>Push the code to a GitHub repository
<br>
<br>
STEP 1
<br>
Declare this line to make it a bash script: #! /bin/bash
<br>
#Filename for the report
REPORT_FILE="system_report.txt"
<br>
At this point, declare the variable EMAIL to send the report to.
<br>
#Create or clear the report file 
<br>
echo "Generating system report......" >"$REPORT_FILE"
<br> 
echo ".............................." >> "$REPORT_FILE"
<br>
echo "" >> "$REPORT_FILE"
<br>
##Command to get the CPU Information:
<br>
echo "CPU info: $(lscpu | grep 'Model name' | awk -F ':' '{ print $2 }' | xargs)" >> "$REPORT_FILE"
<br>
#Command to get the Memory Usage
<br>
echo "Memory usage:" >> "$REPORT_FILE" 
<br>
free -h >> "$REPORT_FILE"
<br>
#Commmand to get the Disk Usage
echo :"Disk Usage: " >> "$REPORT_FILE"
df -h >> "$REPORT_FILE"

#Finish report
echo "" >> "REPORT_FILE"
echo "Report generated on: $(date)" >> "$REPORT_FILE"

#Command to Print report file location
echo "System report saved to: $REPORT_FILE"

#Send the report as an email attachment
if command -v mail &> /dev/null; then

echo "Hello G3W, please find the attached system report. Regards, Mary." | mail -s "Daily System Report" -A  "$REPORT_FILE" "$EMAIL" "$CC"
 echo "Email sent to: $EMAIL $CC"
else
 echo "Error: 'Mail' command not found. please install mailutils or mailx"
fi

![image](https://github.com/user-attachments/assets/1de8fce6-d6e3-41ee-b04b-51451ad1a1a1)
