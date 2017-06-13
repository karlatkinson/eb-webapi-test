PARAM(
    [Parameter(Mandatory=$False,Position=1)]
    [string]$EnvironmentName = $(throw "EnvironmentName is mandatory, please provide a value."),
		
    [Parameter(Mandatory=$False,Position=2)]
    [string]$Region = $(throw "Region is mandatory, please provide a value."),

    [Parameter(Mandatory=$False,Position=3)]
    [string]$Version = $(throw "Version is mandatory, please provide a value.")
)
$ErrorActionPreference = “Stop”

function Wait-For-Environment-Status([string]$expectedHealth) {
    $statusMatched = $false
    do {
        Write-Host "Getting environment status..."
        $environment = Get-EBEnvironment -EnvironmentName $EnvironmentName -Region $Region

        Write-Host "Environment health is $($environment.Status). Waiting for $expectedHealth."
        if($environment.Status -eq $expectedHealth) {
            $statusMatched = $true
        } else {
            Start-Sleep -Seconds 5
        }
    } until($statusMatched)
}

Write-Host "Deploying version $Version to $EnvironmentName in region $Region"
#Update-EBEnvironment -EnvironmentName $EnvironmentName -Region $Region -VersionLabel $Version

Write-Host "Waiting for deployment to start..."
Wait-For-Environment-Status("Updating")
Write-Host "Deployment has started."

Write-Host "Waiting for deployment to complete..."
Wait-For-Environment-Status("Ready")
Write-Host "Deployment completed."
