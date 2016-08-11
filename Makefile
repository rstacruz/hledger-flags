mdx = ./node_modules/.bin/mdx --markdown -x internal

update: README.md
README.md: index.js
	(sed '/<!--api-->/q' $@; echo; ${mdx} $^; sed -n '/<!--api:end-->/,$$p' $@) > $@~
	mv $@~ $@
