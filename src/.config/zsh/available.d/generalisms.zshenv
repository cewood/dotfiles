##
# Quiet grep since it's depreciated GREP_OPTIONS using environment
#  variables; solution unset the env options and use an alias.
unset GREP_OPTIONS
alias grep='grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn'

# Ansible fix for python3 incompatibility
export ansible_python_interpreter=/home/cewood/.anyenv/envs/pyenv/shims/python
export ANSIBLE_PYTHON_INTERPRETER=/home/cewood/.anyenv/envs/pyenv/shims/python
export local_ansible_python_interpreter=/home/cewood/.anyenv/envs/pyenv/shims/python
export LOCAL_ANSIBLE_PYTHON_INTERPRETER=/home/cewood/.anyenv/envs/pyenv/shims/python

#export ANSIBLE_EXTRA_ARGS="-vvvv -e ansible_python_interpreter=~/.anyenv/envs/pyenv/shims/python"
#export PACKER_EXTRA_ARGS=""

alias serve='exec docker run --rm -v $PWD:/usr/local/apache2/htdocs/:ro -p 8080:80 httpd:2.4'

# SSH yolo command, no host key checking
alias sshyolo='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias sshbootstrapper='sshyolo -i ~/.ssh/bootstrapper@datajet.local.rsa.pub'
alias scpyolo='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
vpn() { pushd ~/Documents/vpn/${1} && sudo openvpn --config vpn.ovpn; popd }
