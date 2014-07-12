$TTL	60 ;
; $TTL used for all RRs without explicit TTL value
$ORIGIN devrandom.ro.
@  1D  IN  SOA devrandom.ro. hostmaster.devrandom.ro. (
                              2014020101 ; serial
                              1200 ; refresh
                              15 ; retry
                              1w ; expire
                              3h ; minimum
                             )
       IN  NS     ns1.devrandom.ro. ; in the domain
ns1    IN  A      192.168.0.1  ;name server definition
www    IN  A      192.168.0.2  ;web server definition
