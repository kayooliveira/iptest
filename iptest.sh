## Cores de Fonte
K="\033[0;30m" # Black (Preto)
R="\033[0;31m" # Red (Vermelho)
G="\033[0;32m" # Green (Verde)
Y="\033[0;33m" # Yellow (Amarelo)
B="\033[0;34m" # Blue (Azul)
M="\033[0;35m" # Magenta (Vermelho Claro)
C="\033[0;36m" # Cyan (Ciano - Azul Claro)
W="\033[0;37m" # White (Branco)

## Efeito Negrito (bold) e cores
BK="\033[1;30m" # Bold+Black (Negrito+Preto)
BR="\033[1;31m" # Bold+Red (Negrito+Vermelho)
BG="\033[1;32m" # Bold+Green (Negrito+Verde)
BY="\033[1;33m" # Bold+Yellow (Negrito+Amarelo)
BB="\033[1;34m" # Bold+Blue (Negrito+Azul)
BM="\033[1;35m" # Bold+Magenta (Negrito+Vermelho Claro)
BC="\033[1;36m" # Bold+Cyan (Negrito+Ciano - Azul Claro)
BW="\033[1;37m" # Bold+White (Negrito+Branco)

## Cores de fundo (backgroud)
BGK="\033[40m" # Black (Preto)
BGR="\033[41m" # Red (Vermelho)
BGG="\033[42m" # Green (Verde)
BGY="\033[43m" # Yellow (Amarelo)
BGB="\033[44m" # Blue (Azul)
BGM="\033[45m" # Magenta (Vermelho Claro)
BGC="\033[46m" # Cyan (Ciano - Azul Claro)
BGW="\033[47m" # White (Branco)

#Atributos do script
ip=$1
range=`seq 1 $2`
# dir=`> $3`
dir=$3

function helpScreen(){
	clear
		echo -e "$BC###################################################################"
		echo -e "$BC#                                                                 #"
		echo -e "$BC#            $BG IPTEST $BM developed by $BR KayoOliveira $BC                 #"
		echo -e "$BC#                                                                 #"
		echo -e "$BC# --------------------------------------------------------------- #"
		echo -e "$BC#                                                                 #"
		echo -e "$BC#            USAGE EXAMPLE:$BG iptest $BG[$BR'ip_addres'$BG] $BG[$BR'range'$BG]$BC        #"
		echo -e "$BC#                 EXAMPLE:$BG iptest$BR 127.0.0 100                    $BC #"
		echo -e "$BC#   $BG IPTEST$BR will test all IPs with final range from$BW 1$BR to$BW 100$BW      $BC#"
		echo -e "$BC#                                                                 #"
		echo -e "$BC#$BW        USE $BC--write $BG[$BR'directory'$BG]$BW to write results to a file$BC     #"
		echo -e "$BC#                                                                 #"
		echo -e "$BC###################################################################"
		exit
}
if [[ $1 == "" ]]; then
	helpScreen
fi
if [[ $2 == "" ]]; then
	helpScreen
fi
if [[ -z $3 ]]; then
	dir=""
fi
if [[ $3 == "" ]]; then
	for ranges in $range;do
		ping -c1 $1.$ranges | grep "64 bytes" | cut -d " " -f 4,7,8 
	done
else
	for ranges in $range;do
		ping -c1 $1.$ranges | grep "64 bytes" | cut -d " " -f 4,7,8 >> $3 
	done
fi