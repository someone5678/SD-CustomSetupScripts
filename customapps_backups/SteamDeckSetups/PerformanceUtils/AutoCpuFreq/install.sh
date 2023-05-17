#!/usr/bin/sh -x

CWD=$(pwd)
SRC="auto-cpufreq"

cd $CWD
git clone https://github.com/AdnanHodzic/auto-cpufreq $CWD/$SRC
cd $CWD/$SRC
mkdir -p "$HOME/.local"
ln -s . "$HOME/.local/usr"
python -m ensurepip --upgrade
python -m pip install --upgrade pip
python -m pip install distro
sed -i 's|^\([^#].*\)/usr/\(local/\)\?|\1'"$HOME"'/.local/|g' $CWD/$SRC/auto_cpufreq/core.py
python $CWD/$SRC/setup.py build
python $CWD/$SRC/setup.py install --root="$HOME/.local" --optimize=1 --skip-build
install -Dm755 $CWD/$SRC/scripts/cpufreqctl.sh -t "$HOME/.local/share/auto-cpufreq/scripts"

mkdir -p $HOME/.config/environment.d
if ! grep -q "$HOME/.local/bin" $HOME/.config/environment.d/envvars.conf ;
then
tee -a $HOME/.config/environment.d/envvars.conf <<EOF
PATH="$PATH:$HOME/.local/bin"
EOF
fi

if ! grep -q "$HOME/.local/bin" $HOME/.bash_profile ; 
then
tee -a $HOME/.bash_profile <<EOF
if [ -d "$HOME/.local/bin" ];
then
    export PATH="$PATH:$HOME/.local/bin"
fi
EOF
fi

if [ -f $HOME/.zshrc ];
then
    if ! grep -q "$HOME/.local/bin" $HOME/.zshrc ;
    then
tee -a $HOME/.zshrc <<EOF
if [ -d "$HOME/.local/bin" ];
then
    export PATH="$PATH:$HOME/.local/bin"
fi
EOF
    fi
fi

if [ ! -f $HOME/.config/auto-cpufreq.conf ];
then
tee -a $HOME/.config/auto-cpufreq.conf <<EOF
[charger]
governor = schedutil

[battery]
governor = schedutil
EOF
fi

mkdir -p $HOME/.config/systemd/user
if [ ! -f $HOME/.config/systemd/user/auto-cpufreq.service ];
then
tee -a $HOME/.config/systemd/user/auto-cpufreq.service <<EOF
[Unit]
Description=auto-cpufreq - Automatic CPU speed & power optimizer for Linux

[Service]
Type=simple
ExecStart=sudo -E -n -- "%h/.local/bin/auto-cpufreq" --daemon --config "%h/.config/auto-cpufreq.conf"
Restart=on-failure

[Install]
WantedBy=default.target
EOF
fi

if [ ! -f /etc/sudoers.d/zzz-auto-cpufreq ];
then
echo "$USER ALL=(ALL) NOPASSWD:SETENV: $HOME/.local/bin/auto-cpufreq *" | sudo tee -a /etc/sudoers.d/zzz-auto-cpufreq
sudo chmod 0440 /etc/sudoers.d/zzz-auto-cpufreq
fi

systemctl --user daemon-reload
systemctl --user enable --now auto-cpufreq.service

rm -Rf $CWD/$SRC
