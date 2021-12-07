xrdb -merge ~/.Xresources

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi
while type i3 >/dev/null ; do i3 && continue || break ; done
