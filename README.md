# CoDE - **Co**ntainer **D**evelopment **E**nvironment

## Introduction

The aim of the project is automate the creation of a development environment within a container.

The environment is a Linux shell with access to the following tools ...

- vi / vim
- git
- docker
- ssh

... and SDKs

- .NET Core
- NodeJS

### Terminology

If you are unfamilar with some Linux/Unix terms, the following might help :

- *root user* - analagous to a super-user or system administrator in other systems. A user logged in as `root` can edit system files, create and change users, alter permissions etc. A user will typically *not* perform day-to-day operations as `root`

- *shell* - technically, the shell is the program running in the background that accepts and responds to the commands you enter at the command line. It comprises the command line environment that you operate in. 
It influences everything from which environment (i.e. global) variables are available to you, to what the command-line prompt looks like. 
As with any program, the shell will run with the permissions of the user who started it. The `exit` command is typically used to leave a shell and shut it down, returning the user to the environment they were in before the shell was started. A shell can run within (i.e. as a subprocess of) another shell.

## System Requirements

The host must be a Linux based OS, either native or WSL2, with docker installed.
Access to git while preferable is not strictly necessary.

### Docker Desktop

If running the environment on Windows, install Docker Desktop to set up and configure docker in your WSL2 installation.

- Read the notes on the docker for windows [documentation page](https://docs.docker.com/docker-for-windows/wsl/) and then download and install Docker Desktop.
- Ensure your host OS is running on WSL*2* rather than WSL1. Instructions on how to check this are in the above documentation page.

### Git Credentials

The environment must be built in a directory containing the Personal Access Token, password or key of the Git repository you wish to access from within the container. If the repository offers both HTTPS and SSH access, select HTTPS. 

The Token should be stored in a file named `random.txt`. This file should live in the directory where the container image will be built.

#### Azure
On Azure, the required password can be accessed by going to Azure DevOps >> [Your Project] >> Repos. The `Clone` button at the top right of the file listing will allow you to `Generate Git Credentials`. Copy and paste the generated password. 

### Summary Checklist

- Upgrade host OS
- Install docker
- Acquire https repo token/key/password

- Install git (optional)


## Getting Started Guide

It may be advisable to perform a system upgrade of the host before following the steps below. 

On Ubuntu this can be achieved using `sudo apt update` (to refresh the package database with all the latest version numbers etc.)  followed by `sudo apt upgrade` (to actually download and install the latest available versions of all packages on the system).

- Acquire the [conneqtr/CoDE](https://github.com/conneqtr/CoDE) project from GitHub either via `git clone` or by downloading the zip file.

- Update the `Dockerfile` setting the `NEWUSER` variable to the desired name your user will have within the container.

- Update `dotfiles/dot.gitconfig` with your preferred git username and email settings

- Update `build.sh` editing the '-p' or 'ports' line of the Docker run command to expose the ports your container is required to publish

- Optional : The default name of the final container is 'devcon' if you wish to change this, update the `CONTAINERNAME` variable in `build.sh`. 

- Run `./build.sh`. This will build and run the `CoDE` image , dropping you into the resultant container as `root`.

- Run `./initialise.sh`. This script is designed to be run as `root` within the container. It will perform final setup and  drop you into the home directory of the user you specified in the Dockerfile, as that user.

That completes setup. Now for some operational tips ...

## Using Your Container

If you have followed the getting started guide, you will already be logged into your container as your user.

- Your user runs in a shell within a shell. The inner shell is where you will normally operate, the outer shell is that of the `root` user.

- If you need to run a command as `root`, simply `exit` the shell you are in. You will be returned to the `root` shell.

- If you `exit` the root shell, you will exit the container and it will shut down.

- To return to your user, after exiting to the root shell, issue a 'switchuser' or 'su' command i.e.  `su <your_username>`. You will be returned to your user shell.

### Restarting Your Container

- To restart your container after logging out to the host system, run `docker container start <containername>`. 
  - This can be shortened to `docker start <container_name>`.

- To enter the now running container, run `docker container exec --interactive --tty <containername> bash`
  - This can be shortened to `docker exec --interactive --tty <containername> bash`
  - Or further shortened to `docker exec -it <containername> bash`
  
- You will be logged into your container as `root` and will need to 'switchuser' or `su` into your actual user.

### Ungit

Ungit is a useful Git visualisation tool. Because it is served via a browser it can be used from within a container. To use ungit  :

- Find the ip address of the container. 
	- You can use `ip address show` then look for the line beginning `eth0`
- Pick a port number that your container is exposing.
	- See the 'ports' line in build.sh

- `cd` to the root directory of your version controlled project.
	- This is the directory where the `.git` folder lives.

- Run `ungit --port [port_number] --ungitBindIp [container_ip_address]` 

- Alternatively use the `rungit --port [port_number]` bash alias in `.bashrc`
