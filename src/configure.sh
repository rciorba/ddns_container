echo Configuring..
cp cfg/example.com $ROOT/etc/bind/devrandom.ro.zone
cp cfg/named.conf.local $ROOT/etc/bind/named.conf
chroot $ROOT chown bind /etc/bind/devrandom.ro.zone
chroot $ROOT named-checkconf
chroot $ROOT named-checkzone devrandom.ro /etc/bind/devrandom.ro.zone
echo "named -c /etc/bind/named.conf -f " > $ROOT/run.sh
chmod a+x $ROOT/run.sh
