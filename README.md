# Users Download Directory Scanner
This code is designed to scan files downloaded in the last 5 minutes using Virus Total's API.  The code accomplishes this by pulling files, created in the last 5 minutes, from the user's download directory, hashing the files and then sending the hash to Virus Total API to check if the files are malicious. The API results are returned in a log file defined inside of the code.
The checking of the files age can be adjusted from 5 minutes to a custom time by updating the `$timeInterval` variable. The variable has to be negative for example `$timeIntervol = -10` if you want the files within the last 10 minutes. The files are scanned 4 at a time as to not go over the set quota from Virus Total  This code was designed to be ran based on a schedule using task scheduler.

![image](https://github.com/p123o215/DownloadScanner/assets/62272895/7745969e-ff19-4668-acfc-ce2d99eb48d1)

(Set the Reapeat task every: to what ever you set the `$timeIntervol` var to be exept positive this time)

![image](https://github.com/p123o215/DownloadScanner/assets/62272895/0a2d7e8c-f244-4961-9f80-256a764727cc)

(Set the program/script in the action to be C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe Or the location of powershell and the add arguments to be teh location of the download scanner file)

![image](https://github.com/p123o215/DownloadScanner/assets/62272895/60225326-341f-40dc-b20a-8f46d0035f4d)




You will have to create a free account on Virus Total for an API key  which you will input on this line `$headers.Add("x-apikey", "YOUR API KEY HERE");`.
