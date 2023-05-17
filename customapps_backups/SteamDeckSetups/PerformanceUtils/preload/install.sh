#!/usr/bin/sh -x

CWD=$(pwd)
SRC="preload"
PKGNAME=preload
PKGVER=0.6.4

paru -Sy gcc glib2 help2man --noconfirm

cd $CWD
aria2c http://downloads.sourceforge.net/sourceforge/preload/$PKGNAME-$PKGVER.tar.gz -o $PKGNAME.tar.gz
tar -xvzf $PKGNAME*.tar.gz
mv $PKGNAME-* $PKGNAME
cd $CWD/$SRC

mkdir -p "$HOME/.local"
ln -s . "$HOME/.local/usr"
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/usr/share/man"
mkdir -p "$HOME/.local/usr/bin"
mkdir -p "$HOME/.var"
mkdir -p "$HOME/.config"

sudo ln -sv "$(which cpp)" /lib/cpp

./configure --prefix=$HOME/.usr  \
            --sysconfdir=$HOME/.config \
            --mandir=$HOME/.local/usr/share/man \
            --sbindir=$HOME/.local/usr/bin \
            --localstatedir=$HOME/.var
make install

rm -rf $HOME/.config/rc.d
rm -rf $HOME/.var/lib/preload/preload.state
rm -rf $HOME/.var/log/preload.log

if [ -f $HOME/.config/preload.conf ];
then
sed -r -i 's#^((map|exe)prefix =) (.+)$#\1 /opt;\3#' $HOME/.config/preload.conf
fi

mkdir -p $HOME/.config/systemd/user
if [ ! -f $HOME/.config/systemd/user/preload.service ];
then
tee -a $HOME/.config/systemd/user/preload.service <<EOF
[Unit]
Description=Adaptive readahead daemon

[Service]
Type=simple
IOSchedulingClass=3
EnvironmentFile=%h/.config/sysconfig/preload
ExecStart=sudo -E -n -- "%h/.local/bin/preload" --foreground $PRELOAD_OPTS
Restart=on-failure

[Install]
WantedBy=default.target

EOF
fi

if [ ! -f /etc/sudoers.d/zzz-preload ];
then
echo "$USER ALL=(ALL) NOPASSWD:SETENV: $HOME/.local/bin/preload *" | sudo tee -a /etc/sudoers.d/zzz-preload
sudo chmod 0440 /etc/sudoers.d/zzz-preload
fi

systemctl --user daemon-reload
systemctl --user enable --now preload.service

rm -Rf $CWD/$PKGNAME.tar.gz $CWD/$SRC
