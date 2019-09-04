require 'httparty'
require 'json'

class WeatherForcast
    include HTTParty
  
    base_uri 'http://api.openweathermap.org/data/2.5/'
    
    

    def get_weather_by_cityid(city_id)
        JSON.parse(self.class.get("/forecast?id=#{city_id}&APPID=db116dcd881410ba08bda13ea3fe722d").body)
    end
    
  end

