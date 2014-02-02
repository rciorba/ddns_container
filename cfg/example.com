$TTL	60 ;
; $TTL used for all RRs without explicit TTL value
$ORIGIN ddns.ro.
@  1D  IN  SOA ddns.ro. hostmaster.ddns.ro. (
                              2014020101 ; serial
                              1200 ; refresh
                              15 ; retry
                              1w ; expire
                              3h ; minimum
                             )
       IN  NS     ns1.ddns.ro. ; in the domain
ns1    IN  A      192.168.0.1  ;name server definition
www    IN  A      192.168.0.2  ;web server definition
