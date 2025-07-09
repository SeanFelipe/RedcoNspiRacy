require 'java'
java_import java.lang.Runnable

module Reloader
  FILES =  [
   #"./desktop.rb",
   "./zredc.rb",
  ]

  BASE_DIR = Dir.pwd

  class ReloadRequest
    include Runnable
    def run
      Reloader.reload
    end
  end

  class << self
    def reload(from_listener=false)
      basedir = BASE_DIR
      basedir += '/src' if from_listener
      puts "start reload from dir: #{basedir}"
      $VERBOSE = nil
      FILES.each do |ff|
        path = "#{basedir}/#{ff}"
        puts "loading #{path}..."
        result = load path
        puts result
        puts "load #{path} complete."
        #binding.pry
        #puts
      end
      puts "reloaded files:"
      FILES.each {|ff| puts ff}
      Contents.add_workbox_contents
      #Contents.c = []
      puts "post-reload, workbox contents: #{Contents.c}"
    end

    def post_reload
      Gdx::app::postRunnable(ReloadRequest.new)
    end
  end
end
