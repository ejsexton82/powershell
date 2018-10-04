$shortcuts = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"

# Remove Default Shortcut
$defaultShortcut = "$shortcuts\FileMaker Pro Advanced.exe.lnk"
If (Test-Path $defaultShortcut -PathType Leaf) {
    Remove-Item -Path $defaultShortcut
}

# Rename Executables
For ($i=14; $i -lt 18; $i++) {

    # Rename FileMaker Pro Advanced
    $path= "C:\Program Files\FileMaker\FileMaker Pro $i Advanced"
    $source = "$path\FileMaker Pro Advanced.exe"
    $target = "$path\FileMaker Pro $i Advanced.exe"
    If (Test-Path $source -PathType Leaf) {
        Rename-Item -Path $source -NewName $target -Force

        # Create a Shortcut for the Renamed File
        $WshShell = New-Object -comObject WScript.Shell
        $shortcut = $WshShell.CreateShortcut("$shortcuts\FileMaker Pro $i Advanced (FM$i).lnk")
        $shortcut.TargetPath = $target
        $shortcut.Save()
    }
}
