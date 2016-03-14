# Warp Directory (In Bash)

### Examples
```bash
# add a warp point
cd /freakishly/long/path/that/i/have/to/type/a/fuck/load
wd add flp

# warp to that point
wd flp

# warp to a subfolder of that point
wd flp/subfolder/of/that/point

# remove a warp point
wd rm flp

# list all warp points and their destinations
wd ls
```

#### Setup (Recommended)
First, pull down the repo:
```bash
git clone https://github.com/troyxmccall/wd.git
```

to install
```bash
cd wd
setup/wd install
```

to upgrade
```bash
cd wd
setup/wd upgrade
```

#### Setup (Automatic)
simply paste the following into your command line:
```bash
curl -sL https://raw.github.com/troyxmccall/wd/master/setup/wd | bash -s install
```

#### Setup (Manual)
Define the wd script in your shell by adding the following to a shell startup file (`~/.bash_profile`, `~/.bashrc`, etc.):
```bash
# define the wd function
source "<PATH_TO_wd_SCRIPT>"
```
#### License

Do whatever the fuck you want. Maximum Warp. Engage.
