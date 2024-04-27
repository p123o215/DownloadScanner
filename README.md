# Users Download Directory Scanner
This code is designed to scan recently downloaded files using Virus Total's API
For example if you downloaded 7 files within 10 min and you changed the $timeIntervol var to -10 then every file you downloaded within 10 minutes will be scanned 4 at a time (As to not go over free quota you have to stay under 4 scans a minute)
For this to run peirioticaly you have to set up a task in task scheduler to do this go into task scheduler and follow the pictures, Again  fell free to email me with any questions.

![image](https://github.com/p123o215/DownloadScanner/assets/62272895/ef4bdb7f-8966-4f5f-9218-2da1f91596fb)

(Set the Reapeat task every: to what ever you set the $timeIntervol var to be)

![image](https://github.com/p123o215/DownloadScanner/assets/62272895/0a2d7e8c-f244-4961-9f80-256a764727cc)

(Set the program/script in the action to be C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe Or the location of powershell and the add arguments to be teh location of the download scanner file)

![image](https://github.com/p123o215/DownloadScanner/assets/62272895/60225326-341f-40dc-b20a-8f46d0035f4d)




You will have to create a free account on Virus Total for an API key  which you will input on this line "$headers.Add("x-apikey", "YOUR API KEY HERE");".

This can be used and edited for your personal use only please do not use commercially without my permission. You can contact me about any commercial use with the email show below.

# CONTACT
Feel free to contact my email *razorpeng@gmail.com* with any issues, recommendations, and questions.
