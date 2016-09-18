# mount and update narrow kindle

## What is this doing

1. connect Kindle
1. auto mount `/Volumes/Kindle`
1. run [narou.rb](https://github.com/whiteleaf7/narou) update
1. last, `diskutil eject Kindle volume`

## requirements

- OSX
- ruby
  - gem terminal-notifier
- icons
  - ok.png
  - update.png
  - error.png

```
# frozen_string_literal: true
# A sample Gemfile
source "https://rubygems.org"

gem 'narou'
gem 'terminal-notifier'
```

## test

- OSX
  - 10.11.6
- narrou.rb
  - 2.9.5
- fish shell
  - 2.3.1
- icons
  - https://icons8.com/

## setup

1. save `/Users/YOUR_USER/bin/update_kindle.fish`
1. save `/Users/YOUR_USER/Library/LaunchAgents/fish.update_kindle.plist`
1. move `/Users/YOUR_USER/Library/LaunchAgents`
1. do `launchctl load fish.update_kindle.plist`

setup done.

confirm : `launchctl list fish.update_kindle`

## usage

connect Kindle to your mac!

