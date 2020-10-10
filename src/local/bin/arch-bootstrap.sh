#!/bin/bash
#
# Script to bootstrap a new Arch install... inspired by
#   https://github.com/mdaffin/arch-pkgs/blob/master/installer/install-arch
#
# WARNING: this script will destroy ALL data on the selected disk.
#
# This script can be run by executing the following:
#   curl -sL https://tinyurl.com/cewood-arch-bootstrap | bash -s bootstrap

set -eoux pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

MIRRORLIST_URL="https://www.archlinux.org/mirrorlist/?country=AT&country=BE&country=DK&country=FR&country=DE&country=NL&country=SE&country=CH&protocol=https&use_mirror_status=on"
PACKAGE_LIST=(
  acpi_call \
  acpilight \
  adobe-source-sans-pro-fonts \
  anki \
  ansible \
  arandr \
  arch-audit \
  aspell-en \
  aurvote \
  autorandr \
  blueman \
  bluez \
  boomaga-qt5 \
  chromium \
  code \
  compton \
  cups \
  darktable \
  dina-font \
  dkms \
  dmenu \
  docker \
  docker-compose \
  dropbox \
  dunst \
  e2fsprogs \
  efibootmgr \
  electrum \
  elinks \
  eog \
  evemu \
  evince \
  fasd \
  feh \
  ferm \
  figlet \
  file-roller \
  findutils \
  firefox \
  flameshot \
  font-bh-ttf \
  fzf \
  galculator \
  gawk \
  gcc \
  gcc-libs \
  gdm \
  gedit \
  geteltorito \
  gettext \
  gimp \
  git-crypt \
  glibc \
  gnome-calculator \
  gnome-control-center \
  gnome-disk-utility \
  gnome-font-viewer \
  gnome-keyring \
  gnome-screenshot \
  gnome-session \
  gnome-settings-daemon \
  gnome-system-monitor \
  gnome-terminal \
  gnome-themes-extra \
  gnome-user-docs \
  gnome-user-share \
  gnu-free-fonts \
  gnu-netcat \
  go \
  google-chrome \
  gopass \
  gparted \
  gpg-crypter \
  gpicview \
  graphviz \
  grep \
  green-recorder \
  grilo-plugins \
  gtk-vnc \
  gucharmap \
  gvfs-afc \
  gvfs-goa \
  gvfs-google \
  gvfs-gphoto2 \
  gvfs-mtp \
  gvfs-nfs \
  gvfs-smb \
  gzip \
  hplip \
  htop \
  hugin \
  i3-wm \
  i3lock-color \
  i3status \
  inetutils \
  intel-ucode \
  intellij-idea-community-edition \
  iproute2 \
  iputils \
  ispell \
  iw \
  java-openjfx \
  jdk8-openjdk \
  jfsutils \
  jpdftweak \
  jq \
  kbdlight \
  keepassxc \
  less \
  libreoffice-still-en-gb \
  libtool \
  licenses \
  linssid \
  linux \
  linux-firmware \
  linux-headers \
  logrotate \
  lvm2 \
  lxterminal \
  m4 \
  make \
  man-db \
  man-pages \
  masterpdfeditor-free \
  maven \
  mdadm \
  mousetweaks \
  mplayer \
  myrepos \
  nano \
  nautilus \
  neovim \
  netctl \
  network-manager-applet \
  networkmanager \
  networkmanager-openconnect
  nm-connection-editor \
  ntp \
  obs-studio \
  openssh \
  openvpn \
  pacaur \
  pacman \
  pacman-mirrorlist \
  parted \
  pass \
  patch \
  pavucontrol \
  pciutils \
  pdfmod \
  perl \
  perl-date-manip \
  perl-finance-quote \
  perl-term-readkey \
  picom \
  pkgconf \
  playerctl \
  pnmixer \
  powertop \
  procps-ng \
  psmisc \
  pulseaudio \
  python-setuptools \
  rdesktop \
  redshift \
  reiserfsprogs \
  ripgrep \
  rofi \
  roxterm \
  rsync \
  s-nail \
  sakura \
  seahorse \
  sed \
  shadow \
  simple-scan \
  simplescreenrecorder \
  speedcrunch \
  sqlitebrowser \
  sshpass \
  stow \
  strace \
  sudo \
  sushi \
  syncthing \
  syncthing-gtk \
  sysfsutils \
  system-config-printer \
  systemd-boot-pacman-hook \
  systemd-sysvcompat \
  tar \
  tcpdump \
  tcptrace \
  telegram-desktop \
  the_silver_searcher \
  tig \
  tk \
  tlp \
  tmux \
  tp_smapi \
  traceroute \
  tree \
  ttf-carlito \
  ttf-anonymous-pro \
  ttf-bitstream-vera \
  ttf-cascadia-code \
  ttf-croscore \
  ttf-droid \
  ttf-fira-code \
  ttf-fira-mono \
  ttf-hack \
  ttf-ibm-plex \
  ttf-inconsolata \
  ttf-jetbrains-mono \
  ttf-linux-libertine \
  ttf-opensans \
  universal-ctags-git \
  unrar \
  usbutils \
  util-linux \
  vagrant \
  vi \
  virtualbox \
  virtualbox-host-modules-arch \
  vlc \
  vokoscreen \
  weechat \
  wget \
  wireshark-qt \
  wpa_supplicant \
  x264 \
  xautolock \
  xclip \
  xdotool \
  xfsprogs \
  xidlehook \
  xkeycaps \
  xorg-fonts-alias-misc \
  xorg-fonts-misc \
  xorg-server \
  xorg-xev \
  xorg-xinit \
  xorg-xmodmap \
  yay \
  zsh \
)



##
# Bootstrap specific tasks, not safe to be re-run/destructive
#

function bootstrap {
  if [ -f /mnt/.BOOTSTRAPPED ] || [ -f /.BOOTSTRAPPED ]
  then
    echo "This system appears to have been bootstrapped already,"
    echo " found an existing .BOOTSTRAPPED file, skipping."
    return
  fi

  echo "Updating keyring and installing pacman-contrib"
  pacman -Sy --noconfirm \
    archlinux-keyring \
    dialog \
    pacman-contrib

  echo "Updating mirror list"
  curl -s "$MIRRORLIST_URL" | \
      sed -e 's/^#Server/Server/' | \
      rankmirrors --verbose -n 0 - \
      > /etc/pacman.d/mirrorlist

  ### Get infomation from user ###
  hostname=$(dialog --stdout --inputbox "Enter hostname" 0 0) || exit 1
  clear
  : ${hostname:?"hostname cannot be empty"}

  user=$(dialog --stdout --inputbox "Enter admin username" 0 0) || exit 1
  clear
  : ${user:?"user cannot be empty"}

  password=$(dialog --stdout --passwordbox "Enter admin password" 0 0) || exit 1
  clear
  : ${password:?"password cannot be empty"}
  password2=$(dialog --stdout --passwordbox "Enter admin password again" 0 0) || exit 1
  clear
  [[ "$password" == "$password2" ]] || ( echo "Passwords did not match"; exit 1; )

  devicelist=$(lsblk -dplnx size -o name,size | grep -Ev "boot|rpmb|loop" | tac)
  device=$(dialog --stdout --menu "Select installtion disk" 0 0 0 ${devicelist}) || exit 1
  clear

  ### Set up logging ###
  exec 1> >(tee "/tmp/bootstrap-stdout.log")
  exec 2> >(tee "/tmp/bootstrap-stderr.log")

  timedatectl set-ntp true

  parted --script "${device}" -- mklabel gpt \
    mkpart primary fat32 1049kB 538MiB \
    set 1 boot on \
    set 1 esp on \
    mkpart primary ext4 538MiB 100% \
    name 1 boot \
    name 2 luks

  # Simple globbing was not enough as on one device I needed to match /dev/mmcblk0p1 
  # but not /dev/mmcblk0boot1 while being able to match /dev/sda1 on other devices.
  part_boot="$(ls ${device}* | grep -E "^${device}p?1$")"
  part_root="$(ls ${device}* | grep -E "^${device}p?2$")"

  wipefs "${part_boot}"
  wipefs "${part_root}"

  echo -n "${password}" | cryptsetup --verbose --batch-mode luksFormat --type luks2 ${part_root} -
  echo -n "${password}" | cryptsetup --verbose --key-file - open ${part_root} storage

  pvcreate /dev/mapper/storage
  vgcreate ${hostname} /dev/mapper/storage
  lvcreate -L 8G ${hostname} -n swap
  lvcreate -l 90%FREE ${hostname} -n root

  mkfs.vfat -F32 "${part_boot}"
  mkswap "/dev/${hostname}/swap"
  mkfs.ext4 "/dev/${hostname}/root"

  swapon "/dev/${hostname}/swap"
  mount "/dev/${hostname}/root" /mnt
  mkdir /mnt/boot
  mount "${part_boot}" /mnt/boot

  pacstrap /mnt base base-devel git zsh
  genfstab -U /mnt >> /mnt/etc/fstab
  echo "${hostname}" > /mnt/etc/hostname

  # Create the hosts file
  cat <<EOF > /mnt/etc/hosts
127.0.0.1       localhost
127.0.1.1       ${hostname}.bridge.middlearth.lan ${hostname}
::1             localhost
::1             ${hostname}.bridge.middlearth.lan ${hostname}
EOF

  cp /etc/mkinitcpio.conf /mnt/etc/mkinitcpio.conf
  sed -i 's/^MODULES=()/MODULES=(atkbd)/' /mnt/etc/mkinitcpio.conf
  sed -i 's/^HOOKS=.*/HOOKS=(base udev keyboard keymap consolefont autodetect modconf block encrypt lvm2 filesystems fsck)/' /mnt/etc/mkinitcpio.conf

  arch-chroot /mnt bootctl install

  cat <<EOF > /mnt/boot/loader/loader.conf
default arch
EOF

  cat <<EOF > /mnt/boot/loader/entries/arch.conf
title    Arch Linux
linux    /vmlinuz-linux
initrd   /intel-ucode.img
initrd   /initramfs-linux.img
options  cryptdevice=UUID=$(blkid -s UUID -o value ${part_root}):storage resume=UUID=$(blkid -s UUID -o value /dev/${hostname}/swap) root=/dev/${hostname}/root rw
EOF

  echo "LANG=en_GB.UTF-8" > /mnt/etc/locale.conf

  arch-chroot /mnt useradd -mU -s /usr/bin/zsh -G wheel,uucp,video,audio,storage,games,input "$user"
  arch-chroot /mnt chsh -s /usr/bin/zsh

  echo "$user:$password" | chpasswd --root /mnt
  echo "root:$password" | chpasswd --root /mnt

  # Temporarily disable password for sudoers from wheel group
  sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /mnt/etc/sudoers

  arch-chroot /mnt su ${user} bash -c '\
    git clone https://aur.archlinux.org/yay.git /tmp/yay \
    && cd /tmp/yay \
    && makepkg -si --noconfirm'

  touch /mnt/.BOOTSTRAPPED

  # TODO: copy this to disk somewhere and run locally instead of
  #   downloading again, which is sub-optimal
  arch-chroot /mnt sudo -u cewood bash -c \
    'curl -sL https://goo.gl/E1V3sP | bash -s post'
  
  # Revert temporary sudo changes, require password for wheel group
  sed -i 's/%wheel ALL=(ALL) NOPASSWD: ALL/# %wheel ALL=(ALL) NOPASSWD: ALL/' /mnt/etc/sudoers
  sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /mnt/etc/sudoers
}



##
# Any normal/post-bootstrap tasks to perform
#
function post {
  if [ ! -f /.BOOTSTRAPPED ]
  then
    echo "This system hasn't been bootstrapped already,"
    echo " no /.BOOTSTRAPPED file found, skipping."
    return
  fi

  # Set the timezone
  sudo ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

  # Sync the hardware clock
  sudo hwclock --systohc

  # Generate the locales
  sudo locale-gen
  
  mkdir -p ~/.gnupg
  cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/gpg.conf
  echo "keyserver pool.sks-keyservers.net" > ~/.gnupg/gpg.conf

  packages
}



##
# Any normal/post-bootstrap tasks to perform
#
function packages {
  if [ ! -f /.BOOTSTRAPPED ]
  then
    echo "This system hasn't been bootstrapped already,"
    echo " no /.BOOTSTRAPPED file found, skipping."
    return
  fi

  ### Set up logging ###
  exec 1> >(tee "/tmp/packages-stdout.log")
  exec 2> >(tee "/tmp/packages-stderr.log")

  yay --noconfirm -S ${PACKAGE_LIST[*]}

  sudo usermod -aG docker,lp ${USER}
}



##
# Run the things
#
case ${1:-packages} in
bootstrap)
  bootstrap
  ;;
post)
  post
  ;;
packages)
  packages
  ;;
esac
