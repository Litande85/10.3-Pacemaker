resource mysql {
protocol C;

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
        device /dev/drbd2;
        disk /dev/vg0/mysql;
        address 192.168.56.120:7795;
        meta-disk internal;
    }
on nodeone
    {
        device /dev/drbd2;
        disk /dev/vg0/mysql;
        address 192.168.56.110:7795;
        meta-disk internal;
    }
}