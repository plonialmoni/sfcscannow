# Define the detection script
$logPath = "C:\Windows\Logs\CBS\CBS.log"

# Check if the CBS.log file exists
if (Test-Path -Path $logPath) {
    # Read the CBS.log file and check for the completion message
    $logContent = Get-Content -Path $logPath -Tail 100
    if ($logContent -contains "Verification 100% complete") {
        Write-Output "System File Checker scan completed successfully."
        exit 0
    } else {
        Write-Output "System File Checker scan did not complete successfully."
        exit 1
    }
} else {
    Write-Output "CBS.log file not found."
    exit 1
}
