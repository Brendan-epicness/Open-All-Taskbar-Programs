

# PowerShell script to list the DLL files under the system32 folder
$Dir = get-childitem "C:\Users\Brendan.Wright\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar" -recurse #Set your direcotry to search.
# $Dir |get-member

$List = $Dir # | where {$_.extension -eq ".lnk"} #Just change the extension for what you are looking for.
$List |ft fullname |out-file C:\Scripts\taskbar.txt #You can change this file name to whatever you want.
#$List |  format-table name 
#start "C:\Users\Brendan.Wright\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"