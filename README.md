# imageGlitch
Destroys images in an artistic way.<br />
Opens a desired image, corrupts bytes throughout and resaves the file.<br />

<b>Usage</b><br />
Windows only!<br />
Place imageGlitch.ps1 along with a file in a folder.<br />
Right click on imageGlitch.ps1 and select "Run With PowerShell"<br />
Enter the name of the file with an extension I.E. test.jpg<br />
Enter the number of bytes to change throughout the file. For higher resolution pictures 2000+ works best. For lower resolutions, try below 200.<br />
Enter the spacing between each byte change. The reccommended value usually works best and calculates for the best placement in file.<br />
The result will be created in a run1 folder (or run2, 3 4 etc for subsequent runs)<br /><br />

# audioGlitch
A modified imageGlitch script that uses a random to change bytes instead of a list of predetermined values.<br />

<b>Usage</b><br />
Same as imageGlitch, however use an audio file with audioGlitch.ps1<br />
