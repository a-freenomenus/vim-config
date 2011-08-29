# Cross Platform Vim Config

This is a distribution of vim plugins, tools and configurations intended to be run on MacVim, as well as Gvim for Windows and Linux. It borrows heavily from techniques found in [Janus](https://github.com/carlhuda/janus), [Vimcasts](http://vimcasts.org/), and countless other blogs and websites.

## Vim Requirements

`Vim 7.3`
`+ruby, +python, +signs`

You can check what features your version of Vim supports by typing the following:

```:echo has('property') must output 1```

## System Requirements
Asides from the above, you also require software in order to build native extensions, such as Xcode, Ruby DevKit, build-essentials, etc, as well as support for syntax checking and other plugins.

Mac   => ```brew install node csstidy lua jslint && curl http://npmjs.org/install.sh | sh```

Linux => ```apt-get install php5-cli pyflakes build-essential tidy lua5.1 lacheck```

Ruby  => ```gem install coffee-script sass haml```

Node  => ```npm install -g coffee-script cucumber less lint csslint```


### Fixing Syntastic's LESS support
Syntastic references lessc via the command line, but recent versions are symlinked against /usr/bin/less. To address this, run the following in a Terminal:

    sudo ln -s /usr/bin/less /usr/bin/lessc

## Todo:
* Missing pyflakes (mac)
* Fugitive/git
