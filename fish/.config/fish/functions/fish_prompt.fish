function fish_prompt
	set_color $fish_color_cwd
	if [ (basename $PWD) = "$USER" ]
		echo -n '~'
	else
		echo -n (basename $PWD)
	end
	set_color normal
	echo -n " » "
end
