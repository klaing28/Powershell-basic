
function Capture-Screenshot {
    param (
        [string]$OutputFilePath
    )

    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $Screen = [System.Windows.Forms.Screen]::PrimaryScreen
    $Bitmap = New-Object System.Drawing.Bitmap $Screen.Bounds.Width, $Screen.Bounds.Height
    $Graphics = [System.Drawing.Graphics]::FromImage($Bitmap)
    
    $Graphics.CopyFromScreen($Screen.Bounds.Location, [System.Drawing.Point]::Empty, $Screen.Bounds.Size)
    $Bitmap.Save($OutputFilePath, [System.Drawing.Imaging.ImageFormat]::Png)
    
    $Graphics.Dispose()
    $Bitmap.Dispose()
}


$OutputDirectory = "C:\Screenshots"
$FileName = "Screenshot_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".png"
$OutputFilePath = Join-Path -Path $OutputDirectory -ChildPath $FileName

Capture-Screenshot -OutputFilePath $OutputFilePath
[System.Windows.Forms.MessageBox]::Show("Love your style")