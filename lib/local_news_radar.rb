require "rexml/document"
include REXML

module ParolkarInnovationLab
  module SocialNet
     module LocalNewsRadar  
       class LocalNewsRadar
          def self.scan_for(array_location_obj)
               array_location_obj.each{|obj|
                   lat = obj.lat
                   lng = obj.lng
                   self.scan({:lat => lat, :lng => lng})
                 }
          end   
          
          
         def self.scan (hash_lat_lng)    
            api_url =    "http://api.outside.in/radar.xml?lat=#{hash_lat_lng[:lat].to_s}&lng=#{hash_lat_lng[:lng].to_s}"
            #api_url =    "http://api.outside.in/radar.xml?lat=40.755970&lng=-73.986702" #For Debugging
            res = Net::HTTP.get_response(URI.parse(api_url))           
            doc = Document.new res.body
            radars = doc.root
            
            radars.elements.each("radar") do |radar| 
              rd_hash = {
                :item_type => radar.attributes["type"].to_s,
                :item_id =>  radar.elements["item_id"].text,
                :icon_path =>  radar.elements["icon_path"].text,
                :author =>  radar.elements["author"].text,
                :author_url =>  radar.elements["author_url"].text,
                :published_at =>  radar.elements["published_at"].text,
                :title =>  radar.elements["title"].text,
                :body =>  radar.elements["body"].text,
                :url =>  radar.elements["url"].text,
              }
              
              rd = Radar.find_by_item_id(rd_hash[:item_id])
              rd = Radar.new(rd_hash) if !rd
              rd.save if rd.new_record?        
              
              # now fetch places  
              places = radar.elements["places"]  
              radar_places =[]
              places.elements.each("place") do |place| 
                pl_hash = {
                  :place_id  => place.elements["id"].text, 
                  :name  => place.elements["name"].text,
                  :geo_rss_point => place.elements["georss:point"].text,
                  :url =>   place.elements["url"].text,
                }   
                pl = RadarPlace.find_by_place_id(pl_hash[:place_id])
                pl = RadarPlace.new(pl_hash) if !pl
                pl.save if pl.new_record?
                
                # Location mapping
                lat_lng = pl.geo_rss_point.split(" ")
                loc = Location.find_by_lat_and_lng(lat_lng[0],lat_lng[1])
                loc = Location.new({:lat => lat_lng[0], :lng =>lat_lng[1] }) if !loc
                pl.location = loc
                pl.save
                
                if ! rd.radar_places.include? pl
                  rd.radar_places.push pl
                  rd.save
                end
                
              end #end of fetch places 
              
            end
            
           
         
         end
       end #end of class
          
                 
     end 
  end
end