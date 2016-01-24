if [  $1 -eq 0 ||  $2 -eq 0 ]; then
  echo usage: $0 hostname outputfile
  exit -1
fi
if [ $(which wget) ]; then
  wget -o $2 $1/robots.txt --user-agent=""
elif [ !$(which curl) ]; then
  curl $1/robots.txt --user-agent "" -L >> $2
elif [ !$(which telnet) ]; then
  echo GET /robots.txt HTTP/1.0 >> tmpfile.txt
  echo \n >> tmpfile.txt
  telnet $1 80 < tmpfile.txt >> $2
  rm tmpfile.txt
else
  echo no suitable command found
  exit -2
fi 
