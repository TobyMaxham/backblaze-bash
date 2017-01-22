
$fileToUp = "E:\path\to\your\file.bmp"; `
$remoteFile = "remote/path/file.bmp"; `
$mimeType = "image/bmp"; `
$bucketID = "Your-Bucket-ID"; `
$accID = "Your-Account-ID"; `
$apiKey = "Your-API-Key"; `
$author = $env:UserName; `
$shaHash = $(certUtil -hashfile $fileToUp SHA1)[1] -replace " ", ""; `
$authAcc = $(.\curl.exe -s https://api.backblaze.com/b2api/v1/b2_authorize_account -u $($accID + ":" + $apiKey) | ConvertFrom-Json); `
$uplUrl = $(.\curl.exe -s -H $("Authorization: " + $authAcc.authorizationToken) -d $('{\"bucketId\": \"' + $bucketID + '\"}') $($authAcc.apiUrl + "/b2api/v1/b2_get_upload_url") | ConvertFrom-Json); `
$finishResult = $(.\curl.exe -H $("Authorization: " + $uplUrl.authorizationToken) `
    -H $("X-Bz-File-Name: " + $remoteFile) `
    -H $("Content-Type: " + $mimeType) `
    -H $("X-Bz-Content-Sha1: " + $shaHash) `
    -H $("X-Bz-Info-Author: " + $author) `
    --data-binary $("@" + $fileToUp) `
    --progress-bar `
    $uplUrl.uploadUrl | ConvertFrom-Json); `
	
echo $finishResult
