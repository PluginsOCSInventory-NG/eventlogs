# View logs extension

An extension to display the Event Viewer's information, warning or error logs.

**View logs information:**

To use this extension, the user has to change the values of the "Parameters" section in the `eventlogs.ps1` file:

- The first value is the log name. It is used to specify the name of the logs. Complete the array (line 17) following this syntax :
    - For one log name, the syntax is `"log name"`.
    - For multiple log names, the syntax is `"first log name", "second log name"`.

- The second value is the type of logs. It is used to specify the type of the logs: Information, Warning or Error. Complete the array (line 23) following this syntax :
    - For one type of logs, the syntax is `"entry type"`.
    - For multiple types of logs, the syntax is `"first entry type", "second entry type"`.

- The third value is the duration (in days). This value is used to retrieve logs for a specific amout of days.

Note: For the first and the second parameters, the example values are writen in comment with the syntax in the agent file (eventlogs.ps1).