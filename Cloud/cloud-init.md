# Documentation and Resources for `cloud-init`

* [Main `cloud-init` Site](https://cloud-init.io/)
* [Official Documentation](https://cloudinit.readthedocs.io/en/latest/index.html)
* [Cloud-init support for virtual machines in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/using-cloud-init)

## `cloud-init` Examples

[Set the hostname with cloud-init](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/cloudinit-update-vm-hostname#set-the-hostname-with-cloud-init):

```yaml
#cloud-config
hostname: myhostname
```

[Update a VM with cloud-init](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/cloudinit-update-vm#update-a-vm-with-cloud-init) and install Apache:

```yaml
#cloud-config
package_upgrade: true
packages:
  - httpd
```

[Add a user to a VM with cloud-init](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/cloudinit-add-user#add-a-user-to-a-vm-with-cloud-init):

```yaml
#cloud-config
users:
  - default
  - name: myadminuser
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
      - ssh-rsa AAAAB3<snip>
```

[Create swap partition for Red Hat and CentOS based images](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/cloudinit-configure-swapfile#create-swap-partition-for-red-hat-and-centos-based-images):

```yaml
#cloud-config
disk_setup:
  ephemeral0:
    table_type: gpt
    layout: [66, [33,82]]
    overwrite: true
fs_setup:
  - device: ephemeral0.1
    filesystem: ext4
  - device: ephemeral0.2
    filesystem: swap
mounts:
  - ["ephemeral0.1", "/mnt"]
  - ["ephemeral0.2", "none", "swap", "sw", "0", "0"]
```

[Run a bash script with cloud-init](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/cloudinit-bash-script#run-a-bash-script-with-cloud-init):

```bash
#!/bin/sh
echo "this has been written via cloud-init" + $(date) >> /tmp/myScript.txt
```

