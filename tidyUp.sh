#!/bin/bash

sub_dir=""
path_construct="/home/sol_share/Arquivo/Ano_20"
dest_path=""
file_name=""
proc_dir=""
pos_ifen=0
pos_under=0
proc_ano=""
dt=`date '+%d/%m/%Y %H:%M:%S'`

echo "+ + + + + + + + + + + +    Script Initiated $dt   + + + + + + + + + + + + + + +" >> /root/scripts/log/arruma.log #Reg of date and time of scrpipt start in log file
cd /home/sol_share/Hold_Area
chown root:sol_g *.* #sets the owner of all files in directory
echo "Changing the owner of all files in the directory 'Hold_Area' (root:sol_g) $dt." >> /root/scripts/log/arruma.log #logs owner change of files, date and time
chmod 0775 *.* #Changing file permitions
dt=`date '+%d/%m/%Y %H:%M:%S'` #get system date and time
echo "Permittions of all files in 'Hold_Area' changed (0755) $dt." >> /root/scripts/log/arruma.log #logs permitions change, date and time


	for f in $( ls ); do
		file_name="${f%.*}"				#Extract file name

		#Set sub-dir destination based on string before '-' (type of process)
        let pos_ifen=`expr index "$file_name" -`
		let pos_under=`expr index "$file_name" _` 	#name of process sub-dir
		proc_dir="${file_name:0:pos_under-1}"		#name of process folder (string before Under-score)
		sub_dir="${file_name:0:pos_ifen-1}/"		#Get sub-dir based on process type (string before '-')
		proc_ano="${proc_dir: -2}"			#get process year	
		
		dest_path="$path_construct$proc_ano/$sub_dir$proc_dir/"			#Caminho completo"

		function creation(){
			if [[ ! -d $dest_path ]]; then #if sub-dir does not exist is created and the file is moved
				mkdir -v $dest_path 
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo "Directory $dest_path created $dt." >> /root/scripts/log/arruma.log #Add line to log file with destination path and the Dir created
				mv -v $f $dest_path ]
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "File moved $f $dt." >> /root/scripts/log/arruma.log #Add line to log file with the name of the file moved and the date and time of the operation
			elif [[ $dest_path ]]; then  #If the Dir already exists, move the file and add line to log file with file name, date and time
				mv -v $f  $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			fi
		}


		if [[ "${proc_dir:0:3}" == "PE-" ]]; then #checks type of process
			creation
		elif [[ "${proc_dir:0:6}" == "PEDel-" ]]; then 
			creation
		elif [[ "${proc_dir:0:4}" == "CPD-" ]]; then
			creation
		elif [[ "${proc_dir:0:7}" == "CPDDel-" ]]; then
			creation
		elif [[ "${proc_dir:0:4}" == "PEP-" ]]; then
			creation
		elif [[ "${proc_dir:0:7}" == "PEPDel-" ]]; then
			creation
		elif [[ "${proc_dir:0:6}" == "BNAAE-" ]]; then
			creation
		elif [[ "${proc_dir:0:3}" == "NA-" ]]; then
			creation
		else
			dt=`date '+%d/%m/%Y %H:%M:%S'`
			echo $f" Does not meet criteria. $dt" 
		fi 

	done
chown -R root:sol_g /home/sol_share/Arquivo
chmod -R 0775 /home/sol_share/Arquivo

