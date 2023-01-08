resource www {
protocol C;
disk {
fencing resource-only;
}
handlers {
fence-peer
"/usr/lib/drbd/crm-fence-peer.sh";
after-resync-target
"/usr/lib/drbd/crm-unfence-peer.sh";
}
syncer {
rate 110M;
}
on nodetwo
{
device /dev/drbd1;
disk /dev/vg0/www;
address 192.168.56.120:7794;
meta-disk internal;
}
on nodeone
{
device /dev/drbd1;
disk /dev/vg0/www;
address 192.168.56.110:7794;
meta-disk internal;
}
}