namespace :local_news_radar do
    
    desc 'Sets up parolkar\'s local_news_radar plugin '
    task :setup do
      
      raise 'local_news_radar plugin was only tested on unix & windows' if ! Rake.application.unix? &&  ! Rake.application.windows?
      
      #copy files
      files_to_be_copied = [
        {:source => "/vendor/plugins/local_news_radar/db/migrate/001_create_radars.rb", :target => "/db/migrate/#{migration_timestamp}_create_radars.rb" },
        {:source => "/vendor/plugins/local_news_radar/db/migrate/002_create_radar_places.rb", :target => "/db/migrate/#{migration_timestamp}_create_radar_places.rb" },
        {:source => "/vendor/plugins/local_news_radar/db/migrate/003_create_radar_place_mappings.rb", :target => "/db/migrate/#{migration_timestamp}_create_radar_place_mappings.rb" },
        {:source => "/vendor/plugins/local_news_radar/config/radar_task_scheduler.rb", :target => "/config/initializers/radar_task_scheduler.rb" }
        ]
      
        FileUtils.mkdir_p("#{root}/db/migrate") unless File.exists?("#{root}/db/migrate")
        files_to_be_copied.each {|ftbc|
          FileUtils.cp_r(root+ftbc[:source], root+ftbc[:target]) #:force => true)
          puts "Created : #{ftbc[:target]}"
        }

        puts "Running \"rake db:migrate\" for you..."
        Rake::Task["db:migrate"].invoke
       
      
      
      welcome_screen
     
    end
 
    def migration_timestamp
      sleep (1)
      Time.now.utc.strftime("%Y%m%d%H%M%S")
      
    end  
    
    def welcome_screen
    
    mesg = <<HERE
Congratulations for setting the plugin! 


HERE

    puts mesg      
    end
    
end