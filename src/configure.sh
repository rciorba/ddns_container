echo Configuring..
cp cfg/example.com $ROOT/etc/bind/ddns.ro.zone
cp cfg/named.conf.local $ROOT/etc/bind/named.conf
chroot $ROOT chown bind /etc/bind/ddns.ro.zone
chroot $ROOT named-checkconf
chroot $ROOT named-checkzone ddns.ro /etc/bind/ddns.ro.zone
echo "named -c /etc/bind/named.conf -f " > $ROOT/run.sh
chmod a+x $ROOT/run.sh
