# Users Download Directory Scanner
This code is designed to scan files downloaded in the last 5 minutes using Virus Total's API.  The code accomplishes this by pulling files, created in the last 5 minutes, from the user's download directory, hashing the files and then sending the hash to Virus Total API to check if the files are malicious. The API results are returned in a log file defined inside of the code.
The checking of the files age can be adjusted from 5 minutes to a custom time by updating the `$timeIntervol` variable. The variable has to be negative for example `$timeIntervol = -10` if you want the files within the last 10 minutes. The files are scanned 4 at a time as to not go over the set quota from Virus Total.  This code was designed to be ran based on a schedule using task scheduler.

![image](https://github.com/p123o215/DownloadScanner/assets/62272895/7745969e-ff19-4668-acfc-ce2d99eb48d1)

(Set the Reapeat task every: to what ever you set the `$timeIntervol` var to be. Except positive this time)

![image](https://github.com/p123o215/DownloadScanner/assets/62272895/66aa4167-9eef-461f-a535-98cbcef5a044)


(Set the program/script in the action to be C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe or the location of powershell and set the add arguments to be the location of the download scanner file)

![image](https://github.com/p123o215/DownloadScanner/assets/62272895/60225326-341f-40dc-b20a-8f46d0035f4d)




You will have to create a free account on Virus Total for an API key  which you will input on this line `$headers.Add("x-apikey", "YOUR API KEY HERE");`.
