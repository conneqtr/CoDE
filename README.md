# CoDE - **Co**ntainer **D**evelopment **E**nvironment

The aim of the project is automate the creation of a development environment within a container.

The environment is a Linux shell with access to the following tools ...

- vi / vim
- git
- docker
- ssh

... and SDKs

- .NET Core
- NodeJS

## System Requirements

The host must be a Linux based OS, either native or WSL2, with docker installed.
Access to git while preferable is not strictly necessary.

The environment must be built in a directory containing the Personal Access Token of the Git repository you wish to access from within the container. The Token should be stored in a file named `random.txt`.

## Getting Started Guide

- Acquire the [conneqtr/CoDE](https://github.com/conneqtr/CoDE) project at GitHub via either `git clone` or by downloading the zip file.

- Update the `Dockerfile` setting the `NEWUSER` variable to the desired name of your user within the container.

- Optional : The default name of the final container is 'devcon' if you wish to change this, update the `CONTAINERNAME` variable in `build.sh`. 

- Run `./build.sh`. This will build and run the `CoDE` image , dropping you into the resultant container as `root`.

- Run `./initialise.sh`. This script is designed to be run as `root` within the container. It will perform final setup and then drop you into the user you specified in the Dockerfile. 

