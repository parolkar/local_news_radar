# This file is placed here automatically by LocalNewsRadar Plugin , Do NOT touch this file unless you know what you are doing.
require 'rufus/scheduler'
scheduler = Rufus::Scheduler.start_new      
include ParolkarInnovationLab::SocialNet::LocalNewsRadar

scheduler.every("1m") do
  LocalNewsRadar.scan_for(Location.all)
end