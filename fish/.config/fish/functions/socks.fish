# Defined in /tmp/fish.19Sh8u/socks.fish @ line 2
function socks
	ssh -D 8123 -f -C -q -N ubuntu@13.210.41.231
end
