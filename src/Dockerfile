FROM debian
MAINTAINER Radu Ciorba raduciorba@gmail.com

RUN apt-get -qq update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq bind9 bind9utils
ADD cfg/example.com /etc/bind/ddns.ro.zone
RUN rm /etc/bind/named.conf

ADD cfg/named.conf.local /etc/bind/named.conf
RUN chown bind /etc/bind/ddns.ro.zone
RUN named-checkconf
RUN named-checkzone ddns.ro /etc/bind/ddns.ro.zone
EXPOSE 5053
CMD ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-f"]