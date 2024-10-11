# Bash-Scripting-lab
<H2>Objective of this lab:</H2>

<li>Write a bash script that generates a system report.
<li>Set up a cron job to run this script periodically (e.g., daily).
<li>Add functionality to send the report via email.
<li>Push the code to a GitHub repository
<br>
<br>
<b>STEP 1</b> 
<br>
<br>
Declare this line to make it a bash script: #! /bin/bash
<br>
#Filename for the report: REPORT_FILE="system_report.txt"
<br>
At this point, declare the variable EMAIL to send the report to.
<br>
#Create or clear the report file 
<br>
<br>
echo "Generating system report......" >"$REPORT_FILE"
<br> 
echo ".............................." >> "$REPORT_FILE"
<br>
echo "" >> "$REPORT_FILE"
<br>
<br>
<br>
##Command to get the CPU Information:
<br>
echo "CPU info: $(lscpu | grep 'Model name' | awk -F ':' '{ print $2 }' | xargs)" >> "$REPORT_FILE"
<br>
<br>
#Command to get the Memory Usage: echo "Memory usage:" >> "$REPORT_FILE" 
<br>
free -h >> "$REPORT_FILE"
<br>
<br>
#Commmand to get the Disk Usage: echo :"Disk Usage: " >> "$REPORT_FILE"
<br>df -h >> "$REPORT_FILE"
<br>
<br>
#Finish report
echo "" >> "REPORT_FILE"
<br>
echo "Report generated on: $(date)" >> "$REPORT_FILE"
<br>
#Command to Print report file location
<br>
echo "System report saved to: $REPORT_FILE"
<br>
#Send the report as an email attachment
<br>
if command -v mail &> /dev/null; then
#Adding conditional statement to ensure the email is sent successfully
<br>
echo "Hello G3W, please find the attached system report. Regards, Mary." | mail -s "Daily System Report" -A  "$REPORT_FILE" "$EMAIL" "$CC"
 <br>
 echo "Email sent to: $EMAIL $CC"
 <br>
else
 <br>
 echo "Error: 'Mail' command not found. please install mailutils or mailx"
 <br>
fi
<br>
<br>
<br>
<h2>STEP 2: Cronjob was created to run the script every day at 2am</h2>

![image](https://github.com/user-attachments/assets/1de8fce6-d6e3-41ee-b04b-51451ad1a1a1)

<h2>The step 3 has been configured for sending report to email</h2>

<h2>The final step was done by pushing the script from my terminal to this GITHUB repository</h2>

