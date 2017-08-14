xset +fp ~/.local/share/fonts
xset fp rehash

xmodmap ~/.Xmodmap
xcape -e 'Hyper_L=Escape'

xsetroot -cursor_name left_ptr

compton -bGf -D 2

redshift -l -34.491600:150.770827 -t 6500:3600 -m randr &

exec bspwm
