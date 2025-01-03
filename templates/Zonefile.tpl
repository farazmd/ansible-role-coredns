$ORIGIN {{ zone.name }}. ;
$TTL {{ zone.ttl }} ;
@               IN      SOA ns.{{ zone.name }}. {{ zone.contact }}. (
                                {{ zone.serial }}   ; Serial
                                {{ zone.refresh_interval }} ; Refresh
                                {{ zone.retry_interval }}   ; Retry
                                {{ zone.expiry }}   ; Expire
                                {{ zone.minimum_ttl }}  ; Minimum TTL
                )
@               IN      NS      ns.{{ zone.name }}.     ;
ns              IN      A       {{ zone.ip if zone.ip | default(false) else captured_ip_address }}  ;
