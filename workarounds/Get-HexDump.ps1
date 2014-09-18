##############################################################################
#.Synopsis
#    Display the hex dump of a file.
#
#.Parameter Path
#    Path to file as a string or as a System.IO.FileInfo object;
#    object can be piped into the function, string cannot.
#
#.Parameter Width
#    Number of hex bytes shown per line (default = 16).
#
#.Notes
#    Date: 18.Sep.2014
# Version: 2
#  Author: Eugene Sadovoi based on work of Jason Fossen 
#   Legal: Script provided "AS IS" without warranties or guarantees of any
#          kind.  USE AT YOUR OWN RISK.  Public domain, no rights reserved.
##############################################################################


[CmdletBinding()] Param 
(
    [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)]
    [Alias("FullName","FilePath")] $Path,
    [Int] $Width = 16
)



function Get-HexDump 
{
    [CmdletBinding()] Param 
    (
        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias("FullName","FilePath")] $Path,
        [Int] $Width = 16
    )

    $linecounter = 0
    $paddedhex = $text = $null

    get-content $path -encoding byte -readcount 1 |
    foreach-object `
    {
        if (0 -eq $linecounter) {
            
            if ($null -ne $paddedhex) {
                $paddedhex += ","
                $paddedhex
            }

            $paddedhex = "        0x"
        } else {
            $paddedhex += ", 0x"
        }

        $byteinhex = [String]::Format("{0:X}", $_) 
        $paddedhex += $byteinhex.PadLeft(2,"0")    
        $linecounter += 1

        if ($Width -eq $linecounter) {
            $linecounter = 0
        }
    }
            
    $paddedhex
}


Get-HexDump -path $path -width $width

