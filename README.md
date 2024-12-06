# network graph VM with Ubuntu XFCE + Cytoscape Setup

This repository contains a Vagrant configuration to set up a virtual machine (VM) with Ubuntu, XFCE desktop environment, and software for network graph - Cytoscape, Gephi  etc. This VM can be used for bioinformatics and network visualization tasks.

Optionally it can install these free tools: OpenModelica, GPT4All

## Prerequisites

Before starting, ensure you have the following installed on your host machine:

- **[VirtualBox](https://www.virtualbox.org/)** - The virtualization provider.
- **[Vagrant](https://www.vagrantup.com/)** - The tool to manage the VM setup.

## Getting Started

1. **Clone the Repository**:
   ```bash
   git clone git@git.vito.be:scm/~kulhanet/oncoscreenvm.git
   cd oncoscreenvm
   ```

2. **Start the VM**:
   Use Vagrant to start the VM. This will automatically download the required base box if it's not already present.
   ```bash
   vagrant up
   ```

   This command reads the `Vagrantfile` configuration, provisions the VM, and installs all necessary software, including Ubuntu with XFCE and Cytoscape.

3. **Access the VM**:
   Once the VM setup is complete, you can access gui by opening VirtualBox GUI.
   - The XFCE desktop environment is installed, allowing you to run a lightweight graphical user interface.   

5. **Using Cytoscape**:
   Cytoscape is installed on the VM for network visualization. You can start it from the XFCE desktop environment once you log in.

## Configuration in Vagrantfile

The `Vagrantfile` is pre-configured to set up the following:
- **Ubuntu Base OS**: A minimal Ubuntu image is used as the base.
- **XFCE Desktop**: A lightweight desktop environment is installed for GUI access.
- **Cytoscape**: Network visualization software is installed for bioinformatics tasks.
- **Automatic Setup**: The `Vagrantfile` includes provisioning scripts that automatically install and configure the software on the VM.

## Stopping the VM

To suspend the VM:
```bash
vagrant suspend
```

To halt (shut down) the VM:
```bash
vagrant halt
```

To remove the VM completely:
```bash
vagrant destroy
```

## Additional Notes

- The setup might take a few minutes on the first run as Vagrant downloads the Ubuntu base box and installs all necessary packages.
- Ensure that both VirtualBox and Vagrant are up to date for optimal compatibility.

## Troubleshooting

If you encounter any issues with the setup:
- Run `vagrant reload --provision` to reload and re-provision the VM.
- Check the `Vagrantfile` for configuration settings that might need adjustment.


