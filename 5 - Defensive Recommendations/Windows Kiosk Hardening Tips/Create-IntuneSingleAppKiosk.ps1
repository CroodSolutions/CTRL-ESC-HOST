# Requires:
# Connect-MgGraph -Scopes "DeviceManagementConfiguration.ReadWrite.All"
# Install-Module Microsoft.Graph -Scope CurrentUser

$settingsGetJson = @'
{
  "@odata.context": "https://graph.microsoft.com/beta/$metadata#deviceManagement/deviceConfigurations/$entity",
  "@odata.type": "#microsoft.graph.windowsKioskConfiguration",
  "@microsoft.graph.tips": "Use $select to choose only the properties your app needs, as this can lead to performance improvements.",
  "id": "5335fb6b-1547-41e4-ad24-0113caade694",
  "lastModifiedDateTime": "2026-01-20T15:37:21.8633422Z",
  "roleScopeTagIds": [ "0" ],
  "supportsScopeTags": true,
  "deviceManagementApplicabilityRuleOsEdition": null,
  "deviceManagementApplicabilityRuleOsVersion": null,
  "deviceManagementApplicabilityRuleDeviceMode": null,
  "createdDateTime": "2025-12-01T21:18:59.890082Z",
  "description": null,
  "displayName": "Crood Kiosk - Main",
  "version": 16,
  "kioskBrowserDefaultUrl": "http://bing.com",
  "kioskBrowserEnableHomeButton": false,
  "kioskBrowserEnableNavigationButtons": false,
  "kioskBrowserEnableEndSessionButton": false,
  "kioskBrowserRestartOnIdleTimeInMinutes": null,
  "kioskBrowserBlockedURLs": [],
  "kioskBrowserBlockedUrlExceptions": [],
  "edgeKioskEnablePublicBrowsing": false,
  "windowsKioskForceUpdateSchedule": null,
  "kioskProfiles": [
    {
      "profileId": "cd5be732-d02d-42b8-9da1-5c2ed7d9804d",
      "profileName": "profile",
      "appConfiguration": {
        "@odata.type": "#microsoft.graph.windowsKioskSingleWin32App",
        "win32App": {
          "startLayoutTileSize": "hidden",
          "name": null,
          "appType": "unknown",
          "autoLaunch": false,
          "classicAppPath": "msedge.exe",
          "edgeNoFirstRun": true,
          "edgeKioskIdleTimeoutMinutes": 14,
          "edgeKioskType": "fullScreen",
          "edgeKiosk": "https://www.croodsolutions.com"
        }
      },
      "userAccountsConfiguration": [
        {
          "@odata.type": "#microsoft.graph.windowsKioskAutologon"
        }
      ]
    }
  ]
}
'@

# Convert GET JSON to an object
$kioskObj = $settingsGetJson | ConvertFrom-Json

# Remove READ-ONLY + GET-METADATA properties (these will break POST)
$removeProps = @(
  '@odata.context',
  '@microsoft.graph.tips',
  'id',
  'createdDateTime',
  'lastModifiedDateTime',
  'version',
  'supportsScopeTags'
)

foreach ($p in $removeProps) {
  if ($kioskObj.PSObject.Properties.Name -contains $p) {
    $kioskObj.PSObject.Properties.Remove($p)
  }
}

# Update values for the NEW profile
$kioskObj.displayName = "Crood Single App Kiosk"
$kioskObj.description = ""

# Convert to JSON for POST (deep nesting requires high depth)
$jsonBody = $kioskObj | ConvertTo-Json -Depth 100

# Sanity check JSON validity
$jsonBody | ConvertFrom-Json | Out-Null

# Correct endpoint for Kiosk template profiles:
# POST /deviceManagement/deviceConfigurations  [1](https://techdirectarchive.com/2020/03/08/how-to-configure-favorites-on-microsft-edge-via-group-policy/)
$uri = "https://graph.microsoft.com/beta/deviceManagement/deviceConfigurations"

# Create the NEW kiosk profile
$newProfile = Invoke-MgGraphRequest -Method POST -Uri $uri -Body $jsonBody -ContentType "application/json"

$newProfile
