from fabric.api import local, run, put, env, cd
from fabric.contrib.console import confirm

env.user = 'pi'
env.hosts = ['piinthesky.local']


def deploy():
    put("src/cfg/example.com", "/tmp/ddns.ro.zone")
    put("src/cfg/named.conf.local", "/tmp/named.conf")
    run('sudo mkdir -p /etc/bind/dynamic/')
    run('sudo chown bind /etc/bind/dynamic/')
    run('sudo chown bind:root /etc/bind/dynamic/ddns.ro.zone')
    run("sudo mv /tmp/ddns.ro.zone /etc/bind/dynamic/ddns.ro.zone")
    run("sudo mv /tmp/named.conf /etc/bind/named.conf")
    run('sudo chown root:root /etc/bind/named.conf')
    run('named-checkzone ddns.ro /etc/bind/dynamic/ddns.ro.zone')
    run('named-checkconf /etc/bind/named.conf')
    run("sudo /etc/init.d/bind9 restart")
