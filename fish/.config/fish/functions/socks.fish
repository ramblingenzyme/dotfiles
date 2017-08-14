# Defined in /tmp/fish.8HQPxg/socks.fish @ line 2
function socks
	ssh -D 8123 -f -C -q -N ubuntu@54.206.20.179
end
