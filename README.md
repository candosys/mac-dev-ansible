Anible Notes
============

Ansible is stupid simple. Its a collection of plugins that you call via a YAML formatted DSL. Basically all it does is read the YAML file, referred to as a playbook, and call the modules described. It can run the modules locally or remotely via SSH.  It's written in Python, which only effects you in that you need a non-ancient python installed.

To get started with ansible on a machine run the `bootstrap.sh` script.

Simple Example
--------------
If for example you want to run the playbook to install Java 1.6 you would:

    ansible-playbook -i localhost playbooks/jdk16.yml --ask-pass --ask-sudo-pass
   
What's goin on there is ansible is running the jdk16.yml playbook on localhost and prompting for the passwords it needs.

SSH & Sudo Config
-----------------
For ansible to run well it needs to be able to ssh to the target machine even if it's localhost. There are a couple ways to achieve that. You can install `sshpass` and use the `--ask-pass` argument and ansible will prompt you. Or you can use `ssh-agent` or set up your ssh keys so you can ssh without needed a password.  If you playbook requires system priviledges then you need to have `sudo` access. Again this password can be entered interactively with `--ask-sudo-pass` or if you are configured not to need a password then it's all good as it is.

Inventories
-----------
Ansible will target all the hosts in an `inventory`. The inventoy is just a file listing hosts, optionally grouped and annotated. For simplicity sake a `localhost` inventory was provided that just lists localhost.




