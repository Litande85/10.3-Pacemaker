resource mysql {
protocol B;

disk {
        fencing resource-only;
    }

handlers {
        fence-peer "/usr/lib/drbd/crm-fence-peer.sh";
        after-resync-target "/usr/lib/drbd/crm-unfence-peer.sh";
    }

syncer {
        rate 110M;
    }
on nodetwo
    {
        device /dev/drbd1;
        disk /dev/vg0/mysql;
        address 192.168.0.2:7795;
        meta-disk internal;
    }
on nodeone
    {
        device /dev/drbd1;
        disk /dev/vg0/mysql;
        address 192.168.0.1:7795;
        meta-disk internal;
    }
}