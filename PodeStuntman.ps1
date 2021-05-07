Install-Module -Name Pode -Scope CurrentUser
Install-Module -Name PSWriteHTML -Scope CurrentUser
Import-Module -Name Pode
Import-Module -Name PSWriteHTML
# Import-Module ./Stuntman.dll

Start-PodeServer {
    Add-PodeEndpoint -Address localhost -Port 8080 -Protocol Http
    Add-PodeRoute -Method Get -Path '/Stuntman' -ScriptBlock {
        Get-Stuntman | Write-PodeJsonResponse
    }
}
