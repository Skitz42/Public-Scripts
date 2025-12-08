    $Users = Get-MgUser -All -Property 'UserPrincipalName','DisplayName','SignInActivity'

    $Report = foreach ($User in $Users) {
        [PSCustomObject]@{
            UserPrincipalName = $User.UserPrincipalName
            DisplayName       = $User.DisplayName
            LastSignInDate    = $User.SignInActivity.LastSignInDateTime
        }
    }

    $Report | Export-Csv -Path "C:\Reports\Lastlogin.csv"