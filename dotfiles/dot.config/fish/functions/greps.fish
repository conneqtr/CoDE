# Defined in - @ line 1
function greps --description 'alias greps=grep --exclude-dir=node_modules  --exclude-dir=bin --exclude-dir=obj  -ir'
	grep --exclude-dir=node_modules  --exclude-dir=bin --exclude-dir=obj  -ir $argv;
end
