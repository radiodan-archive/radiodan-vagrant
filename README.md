#Setting up a Radiodan install in VirtualBox using Vagrant

`$ ./setup.sh`

Vagrant will automatically run the `cold_start` provisioning script from
`vendor/cold_start`.

You should now have a working ubuntu installation with all the `cold_start`
packages that would be on the Pi.

Take a snapshot of this state so you don't need to do this again.

    $ vagrant plugin install vagrant-vbox-snapshot
    $ vagrant snapshot take cold-start

You can return to this state at any time by running
`vagrant snapshot go cold-start`.

To enable audio:

    $ vagrant halt
    $ VBoxManage modifyvm vagrant_radiodan --audio coreaudio --audiocontroller ac97
    $ vagrant up

Audio is enabled by default if you setup vagrant using `setup.sh`.
These instructions work on Mac OS X (10.8) because it uses coreaudio. Other
systems might need different parameters. You can use the VirtualBox GUI Settings
panel to select this manually.

TODO:

- Create a box from snapshot so that people don't have to do this
- Document sharing and running the example app?
