# Define the script to run sfc /scannow silently
$script = {
    try {
        # Run sfc /scannow command
        Start-Process -FilePath "sfc.exe" -ArgumentList "/scannow" -NoNewWindow -Wait
        Write-Output "System File Checker scan completed successfully."
    } catch {
        Write-Output "An error occurred while running the System File Checker scan: $_"
    }
}
 
# Execute the script
Invoke-Command -ScriptBlock $script