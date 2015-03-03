<#
Copyright Julian Poyourow 2015
Use by Felix Horan and Jacob Irvin for art only
#>

while($true){
    
    $folderCount = 1
    While ((Test-Path (".\run" + $folderCount)) -eq $true){
        $folderCount++
    }

    New-Item -ItemType directory -Path (".\run" + $folderCount)

    Write-Host Make sure your file is in the same directory as the script is.
    $fileName = Read-Host Enter the file name with the type extension

    $bytes  = [System.IO.File]::ReadAllBytes("./" + $fileName)

    $runs = Read-Host How many runs do you want to do? IE how messed up is this shit gonna get?

    if($runs -lt 400){
        $offset = $bytes.Count / $runs
    } ElseIf($runs -lt 800) {
        $offset = ($bytes.Count / $runs) * 2
    } Else {
        $offset = ($bytes.Count / $runs) * 8
    }
    $recOffset = [math]::Round(($bytes.Count - $offset) / $runs)

    Write-Host
    Write-Host Your file has a size of $bytes.Count
    Write-Host The reccommended offset multiplier is $recOffset
    [int]$magicNum = Read-Host Enter the byte size of offset multiplier

    $byteValues = "0x33","0x32","0x50","142","65","110","210","28","85","198","175","129"
    $byteCounter = 1
    $altWrite = 1
    $fileMod = 1
    For ($i=1; $i -lt $runs; $i++)  {
        $editBytes = $bytes
        $random = Get-Random -minimum 1 -maximum 255 #$byteValues[$byteCounter]
        Write-Host $random
        $editBytes[$offset] = $random
        if(($runs -gt 2000) -and ($altWrite15 -eq 15)){
            [System.IO.File]::WriteAllBytes(".\run" + $folderCount + "\" + $fileMod + $fileName, $bytes)
            $fileMod++
        } elseif (($runs -lt 2001) -and ($altWrite5 -eq 5)){
            [System.IO.File]::WriteAllBytes(".\run" + $folderCount + "\" + $fileMod + $fileName, $bytes)
            $fileMod++
        } elseif ($runs -lt 201) {
            [System.IO.File]::WriteAllBytes(".\run" + $folderCount + "\" + $fileMod + $fileName, $bytes)
            $fileMod++
        }
        if($altWrite5 -gt 5){
            $altWrite5 = 1
        }else{
            $altWrite5++
        }
        if($altWrite15 -gt 15){
            $altWrite15 = 1
        }else{
            $altWrite15++
        }
        Write-Host $offset
        $offset = $offset + $magicNum
        if($byteCounter -gt 11) {
            $byteCounter = 1
        } else {
            $byteCounter++
        }
    }
}

