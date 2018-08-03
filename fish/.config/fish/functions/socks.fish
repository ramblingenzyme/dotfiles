# Defined in /tmp/fish.vG3dBP/socks.fish @ line 2
function socks
	pkill -f 'ssh.*-f'
    ssh -D 8123 -f -C -q -N ubuntu@13.210.41.231
    pgrep -f 'ssh.*-f'
end
