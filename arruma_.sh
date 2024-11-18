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

echo "+ + + + + + + + + + + +    Script Iniciado $dt   + + + + + + + + + + + + + + +" >> /root/scripts/log/arruma.log
cd /home/sol_share/Hold_Area
chown root:sol_g *.*
echo "Alterado o proprietário de todos os ficheiros na directoria Hold_Area (root:sol_g) $dt." >> /root/scripts/log/arruma.log
chmod 0775 *.*
dt=`date '+%d/%m/%Y %H:%M:%S'`
echo "Alteradas as premissões de todos os ficheiros na directoria Hold_Area (0755) $dt." >> /root/scripts/log/arruma.log


	for f in $( ls ); do
		file_name="${f%.*}"				#Extrai nome ficheiro

		#sub-directorio (tipo processo)
        let pos_ifen=`expr index "$file_name" -`
		let pos_under=`expr index "$file_name" _` 	#nome do subdirectorio do processo
		proc_dir="${file_name:0:pos_under-1}"		#Obtem nome da pasta do processo (digitos antes do Under-score)
		sub_dir="${file_name:0:pos_ifen-1}/"		#Obtem sub-directorio com base no tipo de processo (digitos antes do ífen)
		proc_ano="${proc_dir: -2}"			#Obtem o ano do processo	
		
		dest_path="$path_construct$proc_ano/$sub_dir$proc_dir/"			#Caminho completo"

		if [[ "${proc_dir:0:3}" == "PE-" ]]; then
			if [[ ! -d $dest_path ]]; then
				mkdir -v $dest_path 
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo "Directoria $dest_path criada $dt." >> /root/scripts/log/arruma.log 
				mv -v $f $dest_path ]
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			elif [[ $dest_path ]]; then
				mv -v $f  $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			fi
		elif [[ "${proc_dir:0:6}" == "PEDel-" ]]; then
			if [[ ! -d $dest_path ]]; then
				mkdir -v $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo "Directoria $dest_path criada $dt." >> /root/scripts/log/arruma.log 
				mv -v $f $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			elif [[ $dest_path ]]; then
				mv -v $f  $dest_path 
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			fi

		elif [[ "${proc_dir:0:4}" == "CPD-" ]]; then
			if [[ ! -d $dest_path ]]; then
				mkdir -v $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo "Directoria $dest_path criada $dt." >> /root/scripts/log/arruma.log 
				mv -v $f $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			elif [[ $dest_path ]]; then
				mv -v $f  $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			fi

		elif [[ "${proc_dir:0:7}" == "CPDDel-" ]]; then
			if [[ ! -d $dest_path ]]; then
				mkdir -v $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo "Directoria $dest_path criada $dt." >> /root/scripts/log/arruma.log 
				mv -v $f $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			elif [[ $dest_path ]]; then
				mv -v $f  $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			fi

		elif [[ "${proc_dir:0:4}" == "PEP-" ]]; then
			if [[ ! -d $dest_path ]]; then
				mkdir -v $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo "Directoria $dest_path criada $dt." >> /root/scripts/log/arruma.log 
				mv -v $f $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			elif [[ $dest_path ]]; then
				mv -v $f  $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			fi

		elif [[ "${proc_dir:0:7}" == "PEPDel-" ]]; then
			if [[ ! -d $dest_path ]]; then
				mkdir -v $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo "Directoria $dest_path criada $dt." >> /root/scripts/log/arruma.log 
				mv -v $f $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			elif [[ $dest_path ]]; then
				mv -v $f  $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			fi

		elif [[ "${proc_dir:0:6}" == "BNAAE-" ]]; then
			if [[ ! -d $dest_path ]]; then
				mkdir -v $dest_path
				echo "Directoria $dest_path criada $dt." >> /root/scripts/log/arruma.log 
				mv -v $f $dest_path
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			elif [[ $dest_path ]]; then
				mv -v $f  $dest_path
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			fi

		elif [[ "${proc_dir:0:3}" == "NA-" ]]; then
			if [[ ! -d $dest_path ]]; then
				mkdir -v $dest_path
				echo "Directoria $dest_path criada $dt." >> /root/scripts/log/arruma.log 
				mv -v $f $dest_path
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			elif [[ $dest_path ]]; then
				mv -v $f  $dest_path
				dt=`date '+%d/%m/%Y %H:%M:%S'`
				echo  "Foi movido o ficheiro $f $dt." >> /root/scripts/log/arruma.log
			fi

		else
			dt=`date '+%d/%m/%Y %H:%M:%S'`
			echo $f" Não Obedece ao Critério $dt" 
		fi 

	done
chown -R root:sol_g /home/sol_share/Arquivo
chmod -R 0775 /home/sol_share/Arquivo

