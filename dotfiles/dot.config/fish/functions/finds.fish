function finds --description 'super finder'
	find ./ -name node_modules -prune -o -iname "*$argv[1]*" -print | grep -i --color $argv
end
