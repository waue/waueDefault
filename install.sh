#!/bin/sh

#####################
# FUNCTIONS
#####################
installjam (){
echo -n "Install $1? Yes[Enter] No[n]:"
	#echo -n "Yes: Most Recent Version[Enter] or Version [x.x.x] No: [n]"
    read v
    case "$v" in
    *.*.* ) 
    jam lock jquery@1.8.x
    jam install $1 
    ;;
    '' ) 
    	jam install $1;;
    [n,N] ) 
    	;;
    * ) 
		 echo Wrong input - try again!
		 a=;;
    esac
}



##################
# RUN ------------
##################

######
#JAM http://jamjs.org
######
#test ob jam installiert ist
cd ./website/js
if ! which  jam >/dev/null; then
    echo 'Error: Jam is not installed (http://jamjs.org) - Abbording'
#jam ist installiert->pakete werden installiert (jquery, modernizr, ...)
else
	#installjam jquery
	#installjam modernizr
	echo -n "Install another package? Yes[Packagename]/NO[n]"
	read p
	if [ ${p} != "n" ];	then
	 installjam $p 
	fi
fi


##########
# Compass
##########
cd ../css
if ! which  compass >/dev/null; then
    echo 'Error: Compass is not installed (http://compass-style.org/) - Abbording'
#compass ist installiert->wird initziert
else
echo -n "Init compass? Yes[]/NO[n]"
	read p
	if [ ${p} != "n" ];	then
	 	compass  init > /dev/null
		#mv styles.scss sass/screen.scss
	fi
	#todo:jetzt müsste noch eine default struktur ins sass verzeichnis kopiert werden
exit



a=
while [ -z $a ]; do
	a=false
	installjam
 done   
fi


