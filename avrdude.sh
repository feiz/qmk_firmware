# from: https://gist.github.com/nyomo/45cbebc3b273f05d0ae28949158df88f
MODECMD='/mnt/c/Windows/System32/mode.com'

COMPORT1=$(${MODECMD}|grep -o 'COM[0-9]*')
COMPORT2=""
while [ "$COMPORT2" = "" ];do
        sleep 0.5
        printf "."
        COMPORT2=$(${MODECMD}|grep -v '${COMPORT1}'|grep -o 'COM[0-9]*')
done
PORTNUM=$(echo $COMPORT2|sed -e 's/COM//')

avrdude -c avr109 -p atmega32u4 -P /dev/ttyS${PORTNUM} -U flash:w:$*
