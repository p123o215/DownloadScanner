try{
	## Creating the dir for the vius scanner
	mkdir "$drive`:/Users/$user/virusScanner/";
}catch{Write-Host "Already a folder"}

##Getting things prepared
$user = [Environment]::UserName;
$drive = (Get-Location).Drive.Name;

try{
	New-Item -Path "$drive`:/Users/$user/virusScanner/" -Name "downloads.csv" -ItemType File
	New-Item -Path "$drive`:/Users/$user/virusScanner/" -Name "result.csv" -ItemType File
}catch{Write-Host 'Error File already exists. Non fatal'}
##Vars
## Time intervol needs to negative the length back it supposed to check so if you want it to check every thing downloaded 7 minutes before hand the $timeIntervol would be -7
$timeIntervol = -5
$checkTimeStamps = Get-Date;
$checkTimeStamps = $checkTimeStamps.AddMinutes($timeIntervol);
$downloads = (Get-ChildItem -Path "$drive`:/Users/$user/Downloads/" -Recurse | Where-Object {$_.PSIsContainer -eq $false -and $_.LastWriteTime -ge $checkTimeStamps}).FullName;
$docs = Get-Content "$drive`:/Users/$user/virusScanner/downloads.csv";
$counter = 0;

##Main for loop setting all of the calls
foreach($file in $downloads){
	##Checking for Reapeat Files
	if ($docs -contains $file){
		echo "File already in downloads...";
		continue;
	}
	$file
	##adding fils in downloads to a file
	Write-Output "$file" >> "$drive`:/Users/$user/virusScanner/downloads.csv"
	
	##Getting the has of each file
	$hash = Get-FileHash $file;
	$hashHash = $hash.hash;
	
	##Location of API
	$uri = 'https://www.virustotal.com/api/v3/files/'+$hashHash;
	
	##Setting headers
	$headers=@{};
	$headers.Add("accept", "application/json");
	$headers.Add("x-apikey", "YOUR API KEY HERE");
	
	try{
		##API calling
		$response = Invoke-RestMethod -Uri $uri -Method GET -Headers $headers
		$file;
		
		##Outing the result to a file and printing it
		Write-Output $file $response.data.attributes.total_votes >> "$drive`:/Users/$user/virusScanner/result.csv";
		$response.data.attributes.total_votes;
		
	}catch{Write-Output "Unkown Hash from $file with the hash of, $hashHash" >> "$drive`:/Users/$user/virusScanner/result.csv"} 
	
	##Mkaing sure I dont go over Quota every minute
	$counter += 1;
	
	if($counter -ge 3){
		Start-sleep -seconds 61;
		$counter = 0;
	}
	
	##Making sure I dont go over the daily quota
	if($counterage -ge 300){
	
	$counterage = 0;
	}
}
