param(
    [string]$IpAddress
)

# Validate if the IP address is valid
if ($IpAddress -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}') {
    # Append the IP address to list.txt
    Add-Content -Path "/Users/mac/Code/plugin/bin/list.txt" -Value $IpAddress

    # Change directory to where the list.txt file is located
    Set-Location -Path "/Users/mac/Code/plugin/bin/"

    # Add the list.txt file to the Git staging area
    git add /Users/mac/Code/plugin/bin/list.txt

    # Commit the changes with a message containing the IP address
    git commit -m "Add $IpAddress to list.txt"

    # Push the changes to the remote repository (assuming origin as the remote)
    git push
} else {
    Write-Host "Invalid IP address format. Please provide a valid IP address."
}
