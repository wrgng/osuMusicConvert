Add-Type -AssemblyName System.Windows.Forms

# Create OpenFileDialog for image file
$imageFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$imageFileDialog.Filter = "Image Files|*.png;*.jpg;*.jpeg;*.bmp;*.gif"
$imageFileDialog.Title = "Select an Image File"

# Show the dialog and get the result
$imageResult = $imageFileDialog.ShowDialog()
if ($imageResult -eq [System.Windows.Forms.DialogResult]::OK) {
    $imageFilePath = $imageFileDialog.FileName
} else {
    Write-Host "No image file selected."
    exit
}

# Create OpenFileDialog for audio file
$audioFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$audioFileDialog.Filter = "Audio Files|*.mp3;*.wav;*.aac;*.flac"
$audioFileDialog.Title = "Select an Audio File"

# Show the dialog and get the result
$audioResult = $audioFileDialog.ShowDialog()
if ($audioResult -eq [System.Windows.Forms.DialogResult]::OK) {
    $audioFilePath = $audioFileDialog.FileName
} else {
    Write-Host "No audio file selected."
    exit
}

# Create SaveFileDialog for output file
$saveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
$saveFileDialog.Filter = "MP4 Files|*.mp4"
$saveFileDialog.Title = "Save Output File As"       

# Show the dialog and get the result
$saveResult = $saveFileDialog.ShowDialog()
if ($saveResult -eq [System.Windows.Forms.DialogResult]::OK) {
    $outputFilePath = $saveFileDialog.FileName
} else {
    Write-Host "No output file path selected."
    exit
}

# Run ffmpeg command with selected files
ffmpeg -i $imagefilepath -i $audiofilepath -c:v libx264 -c:a aac -b:a 192k $OUTPUTFILEPATH