
Setting up a Radiodan install in VirtualBox using Vagrant

- `$ cd radiodan_vagrant`
- `$ vagrant up`
Vagrant will automatically run the cold_start provisioning script from an adjacent directory called `../cold_start`

You should now have a working debian with all the cold_start packages that would be on the Pi.

Take a snapshot of this state so you don't need to do this again.

  `$ vagrant plugin install vagrant-vbox-snapshot`
  `$ vagrant snapshot take cold-start`

You can return to this state at any time by running `vagrant snapshot go cold-start`.

To enable audio: 

    $ VBoxManage list runningvms
      "cold_start_vagrant_default_1384715508" {fd7b2b44-465c-4109-9f36-86fe76291378}
    $ vagrant halt
    $ VBoxManage modifyvm cold_start_vagrant_default_1384715508 --audio coreaudio --audiocontroller ac97
    $ vagrant up

These instructions work on Mac OS X (10.8) because it uses coreaudio. Other systems might need different parameters. You can use the VirtualBox GUI Settings panel to select this manually.

TODO:

- Create a box from snapshot so that people don't have to do this
- Document sharing and running the example app?
