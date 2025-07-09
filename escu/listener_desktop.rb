require 'listen'
require_relative '../src/reloader'

runfile_dir = 'src'

def start_desktop
  puts 'start_desktop'
  `cd src && jruby -J-XstartOnFirstThread desktop.rb > ../out.desktop 2>&1 &`
end

listener = Listen.to(runfile_dir, only: /\.rb/) do |modified, added, removed|
  puts "modified absolute path: #{modified}"
  puts "added absolute path: #{added}"
  puts "removed absolute path: #{removed}"
  if modified != []
    if modified != nil
      if modified.first.include? 'desktop'
        puts 'noticed desktop runfile was modified'
        start_desktop
      else
        puts 'reloading...'
        Reloader.reload(true)
        puts 'reload complete'
      end
    end
  end
end
listener.start # not blocking

start_desktop

# need a sleep command if we want to auto-respawn
# 16Q0 hot reloading seems to be working good though.
#sleep
