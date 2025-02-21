# Docker on Windows

How you run docker on your windows machine without having to use docker desktop!

## Install wsl if you haven't done so already. 
This gives you a Linux environment inside of Windows

```
wsl --install
```


then open wsl in your terminal

```
wsl
```

## Setup apt

Add Docker's official GPG key
```
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

Add the repository to Apt sources
```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

## Install docker 
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Verify that the installation was successful
```
sudo docker run hello-world
```

## Run docker without using sudo
create a Unix group

```
sudo groupadd docker
```

add the current user to the group
```
sudo gpasswd -a $USER docker
```

**open a new wsl window** and verify that it worked
```
docker run hello-world
```

now back to windows powershell. lets add an alias for docker that hooks up to the docker engine running in wsl.
first find your profile file by typing 
```
$profile
```

then open that file. if you don't have a file in that location create one.

now add these lines to your profile
```
$DOCKER_DISTRO = "ubuntu"
function docker {
	wsl -d $DOCKER_DISTRO docker -H unix:///var/run/docker.sock @Args
}
```

save the file. open a new powershell.
```
docker run --rm -it wernight/funbox nyancat
```

done