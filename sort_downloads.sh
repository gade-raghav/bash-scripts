#! /bin/sh

#Script to sort all pdf,zip,jpg,iso,exe files into their respective files after download.


cd ~/Downloads

#for *.pdf files.
mv *.pdf PDFs/ 2> /dev/null
pdf=$?
if [ $pdf -eq 0 ]
then
	echo "$(date +%b) $(date +%d) $(date +%T) exit status of *.pdf      $pdf" >> ~/work/scripts/logs/sort.logs
else
	echo "$(date +%b) $(date +%d) $(date +%T) exit status of *.pdf      $pdf" >> ~/work/scripts/logs/sort.logs
fi


#for *.zip files.
mv *.zip *.zip ZIPs/ 2> /dev/null
zip=$?
if [ $pdf -eq 0 ]
then
        echo "$(date +%b) $(date +%d) $(date +%T) exit status of *.zip      $zip" >> ~/work/scripts/logs/sort.logs
else
        echo "$(date +%b) $(date +%d) $(date +%T) exit status of *.zip      $zip" >> ~/work/scripts/logs/sort.logs
	
fi


#for media files.
mv *.jpg *.png *.mp4 *.mp3 PICTURES/ 2> /dev/null
jpg=$?
if [ $jpg -eq 0 ]
then
        echo "$(date +%b) $(date +%d) $(date +%T) exit status of *.jpg     $jpg" >> ~/work/scripts/logs/sort.logs
else
        echo "$(date +%b) $(date +%d) $(date +%T) exit status of *.jpg      $jpg" >> ~/work/scripts/logs/sort.logs
fi

#for *.iso files.
mv *.iso ISOs/ 2> /dev/null
iso=$?
if [ $iso -eq 0 ]
then
        echo "$(date +%b) $(date +%d) $(date +%T) exit status of *.iso      $iso" >> ~/work/scripts/logs/sort.logs
else
        echo "$(date +%b) $(date +%d) $(date +%T) exit status of *.iso      $iso" >> ~/work/scripts/logs/sort.logs
fi

#for *.exe files.
mv *.exe EXEs/ 2> /dev/null
exe=$?
if [ $exe -eq 0 ]
then
        echo "$(date +%b) $(date +%d) $(date +%T) exit status of *.exe      $exe" >> ~/work/scripts/logs/sort.logs
else
        echo "$(date +%b) $(date +%d) $(date +%T) exit status of *.exe      $exe" >> ~/work/scripts/logs/sort.logs
fi

#for *.tar.xz files.
mv *.tar.xz TARs/ 2> /dev/null
tar=$?
if [ $tar -eq 0 ]
then
        echo "$(date +%b) $(date +%d) $(date +%T) exit status of *.tar      $tar" >> ~/work/scripts/logs/sort.logs
else
        echo "$(date +%b) $(date +%d) $(date +%T) exit status of *.tar      $tar" >> ~/work/scripts/logs/sort.logs
fi

echo "\n" >> ~/work/scripts/logs/sort.logs








