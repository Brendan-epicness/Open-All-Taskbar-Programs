# PowerShell script to open every pinned taskbar program (1 sec delay between each)
$Dir = get-childitem ".\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar" -recurse #taskbar directory.
#C:\Users\Brendan.Wright\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar
#.\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar

$List = $Dir #needs this to update the txt file when writing it
$List |ft fullname |out-file .\Documents\taskbar.txt #Writes the taskbar program shortcuts to a txt file in the docs folder. 
$a = 3
do { #loops a read of each line in the written txt file and once no text is in a specific line it will stop
 (Get-Content -Path .\Documents\taskbar.txt -TotalCount ($a + 1))[-1]
 $b = (Get-Content -Path .\Documents\taskbar.txt -TotalCount ($a + 1))[-1]
 start $b 
 $a
 $a++
 #(add-content -Path .\Documents\taskbar.txt -Value "start ")[-$a]
 timeout 1
} until ((Get-Content -Path .\Documents\taskbar.txt -TotalCount $a)[-1] -eq "")