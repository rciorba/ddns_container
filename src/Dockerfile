FROM debian
MAINTAINER Radu Ciorba raduciorba@gmail.com

RUN apt-get -qq update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq bind9 bind9utils
ADD cfg/example.com /etc/bind/dynamic/devrandom.ro.zone
ADD cfg/named.conf.local /etc/bind/named.conf
RUN mkdir /cfg/; touch /cfg/devrandom_key.conf
RUN chown --recursive bind /etc/bind/dynamic/
RUN named-checkconf
RUN named-checkzone devrandom.ro /etc/bind/dynamic/devrandom.ro.zone
CMD ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-f", "-u", "bind"]