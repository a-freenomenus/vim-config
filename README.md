== Requires ==

Vim 7.3
+ruby, +python, +signs		

Verify the current version with:

	:echo has('property') must output 1


Requires build-essential/xcode/rubydevkit for Command-T:

	cd ~/.vim/bundle/file-command-t/ruby/command-t
	ruby extconf.rb
	make clean
	make


Additional Requirements:

	Linux => apt-get install php5-cli pyflakes build-essential tidy lua5.1 lacheck 
	
	Ruby  => gem install compass sass haml livereload compass-susy-plugin oily_png rb-inotify serve
	
	Node  => npm install -g coffee-script cucumber


Todo:
missing jsl => javascript lint
missing csslint => css lint


