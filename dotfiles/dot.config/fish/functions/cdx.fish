
function cdx --description 'recursively cd back up to git root'
    
    set TEMP_PWD $pwd
    
    while test ! -e .git

	cd ..

    end

    set --export OLDPWD $TEMP_PWD


end

