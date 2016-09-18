#!/usr/bin/env fish

# require OSX
# require gem terminal-notifier
#

set NOW (date "+%Y/%m/%d %H:%M:%S")

function enable
	true
end

function notify
  # terminal-notifierの -contentImageを使用
	terminal-notifier -message $argv[1] -title "narou kindle update" -group $argv[3] -remove $argv[3] -contentImage /PATH/TO/ICONS/$argv[2]
end

if enable
    if mount -v | grep Kindle
        # narouプロセスが起動していたら処理回避する
        if ps aux | grep narou | grep -v grep
	    notify "duplicated running, so skip." "error.png" "1"
        else
            set NOW (date "+%Y/%m/%d %H:%M:%S")
            notify "updating narou-kindle ... : $NOW" "update.png" "2"
            say -v Ava "updating narrow kindle."
            
            # narou updateが実行可能なPATH
            cd "/PATH/TO/NAROU_DIR"
            bundle exec narou update --time
            
            # Kindleをアンマウントする
            diskutil eject Kindle

            set NOW (date "+%Y/%m/%d %H:%M:%S")
            notify "ejecting narou-kindle . : $NOW" "ok.png" "3"
            say -v Ava "updating narrow kindle, done."
        end
    end
end
