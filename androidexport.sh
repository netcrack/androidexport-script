if [ ! $1 ] || [ ! $2 ] || [ ! $3 ] || [ ! $4 ]
then
  echo "Usage Help: $0 <svg File> <Prefix> <MDPI Width> <MDPI Height>"
elif [ ${1#*.} != "svg" ]
then
        echo "Provide only svg file"
elif ! echo $3 | egrep -q '^[0-9]+$' ;
then
        echo "Provide width as number"
elif ! echo $4 | egrep -q '^[0-9]+$' ;
then
        echo "Provide height as number"
else
        baseWidth=$(bc -l <<< "$3 / 4")
        baseHeight=$(bc -l <<< "$4 / 4")
        filename=$2"_"${1%.*}".png"
        ratios=(4 6 8 12 16)
        folders=(mdpi hdpi xhdpi xxhdpi xxxhdpi)
        index=0
        for ratio in ${ratios[@]}
        do
                foldername=drawable-${folders[$index]}
                exportfile=$foldername/$filename
                width=$(bc -l <<< "$baseWidth * $ratio")
                height=$(bc -l <<< "$baseHeight * $ratio")

                if [ ! -d $foldername ]
                then
                        mkdir $foldername
                fi

                inkscape -f $1 -e $exportfile -w $width -h $height

                index=`expr $index + 1`
        done
fi
