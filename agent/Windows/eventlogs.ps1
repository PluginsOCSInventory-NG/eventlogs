<#
.SYNOPSIS
	This script displays the Event Viewer's information, warning or error logs.

.DESCRIPTION
	This script displays the Event Viewer's information, warning or error logs.
	The output is XML (formatted for PRTG).
#>


<#==========PARAMETERS==========#>

<#
List of log names:
    "Application" | "HardwareEvents" | "Internet Explorer" | "Key Management Service" | "Security" | "System" | "Windows Powershell"
#>
$logName = @("System"); # The syntax for this value is: "logName" or "FirstLogName", "SecondLogName"

<#
List of entry type:
    "Information" | "Warning" | "Error" | "SuccessAudit" (Security log name) | "FailureAudit" (Security log name)
#>
$entryType = @("Warning", "Error"); # The syntax for this value is: "entryType" or "FirstEntryType", "SecondEntryType"

# Enter a number (days)
$date = "7";

<#==============================#>


$xml = ""

foreach($LogName in $logName) {
    
    foreach($EntryType in $entryType) {

        $Logs = Get-EventLog $LogName -EntryType $EntryType -erroraction 'silentlycontinue' -After (Get-Date).AddDays(-$date) # retrieve of logs

        if ($Logs -ne $null) {
            foreach ($Log in $Logs) {
                $Msg = $Log.Message -replace "<|>",""

                $xml += "<EVENTLOGS>"
                $xml += "<LOG_NAME>" + $LogName +"</LOG_NAME>`n"
                $xml += "<ENTRY_TYPE>" + $Log.EntryType + "</ENTRY_TYPE>`n"
                $xml += "<EVENT_ID>" + $Log.EventID + "</EVENT_ID>`n"
                $xml += "<MACHINE_NAME>" + $Log.MachineName + "</MACHINE_NAME>`n"
                $xml += "<SOURCE>" + $Log.Source + "</SOURCE>`n"
                $xml += "<TIME_GENERATED>" + ($Log.TimeGenerated).ToString("yyyy-MM-dd hh:mm:ss") + "</TIME_GENERATED>`n"
                $xml += "<TIME_WRITTEN>" + ($Log.TimeWritten).ToString("yyyy-MM-dd hh:mm:ss") + "</TIME_WRITTEN>`n"
                $xml += "<MESSAGE>" + $Msg + "</MESSAGE>`n"
                $xml += "</EVENTLOGS>`n"
            }
        }
    }
}

if ($xml -eq "") {
    $xml += "<EVENTLOGS>"
    $xml += "</EVENTLOGS>`n"
}

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Write-Output($xml)