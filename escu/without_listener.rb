require 'listen'

runfile_dir = 'is_running/'

def start_desktop
  puts 'start_desktop'
  ENV['ZOMG_DESKTOP'] = 'true'
  ENV['GDX_LIBS_DIR'] = '/Users/gslzwol/stuffs/zomg-owh/libs'
  `cd src && jruby desktop.rb > ../out.desktop 2>&1 &`
end

listener = Listen.to(runfile_dir, only: /^desktop$/) do |modified, added, removed|
  puts "modified absolute path: #{modified}"
  puts "added absolute path: #{added}"
  puts "removed absolute path: #{removed}"
  if modified != []
    if modified != nil
      if modified.first.include? 'desktop'
        puts 'noticed desktop runfile was modified'
        start_desktop
      end
    end
  end
end
listener.start # not blocking

start_desktop

sleep
