su kzoacn
cd /home/kzoacn/
echo "To:kzoacn@outlook.com" > email.txt
echo "From:2776497866@qq.com" >> email.txt
printf "Subject: Log " >> email.txt
date >> email.txt
echo "" >> email.txt
ifconfig | grep inet6 > /home/kzoacn/report/latest
ifconfig | grep inet6 >> email.txt

if ! diff -q /home/kzoacn/report/latest /home/kzoacn/report/last; then
        echo "diff"
        mv /home/kzoacn/report/latest /home/kzoacn/report/last
        ssmtp -v kzoacn@outlook.com < /home/kzoacn/email.txt 2> /home/kzoacn/log
else
        echo "same"
fi
