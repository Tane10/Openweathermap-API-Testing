require 'spec_helper'
require 'httparty'
require 'openweather_fivedays'

describe 'Open weather forcast' do 
    before(:all) do
        @dayforcast_3hrs = WeatherForcast.new
         
        @city_id_result = @dayforcast_3hrs.get_weather_by_cityid(384848)
        @city_id_array = @city_id_result['list']
        @city_id_main = @city_id_result['list'][1]
        
    end 

    it 'should return a status code of 200' do
        expect(@city_id_result['cod']).to eq '200'
        
    end 

    it 'should give you 5 days forcast 3 hrs' do #
        expect(@city_id_array.count).to eq 40 #all the 3 hours intivals of the day
        expect(@city_id_result.keys.count).to eq 5 #all 5 days 
        
    end

    it 'should return city as a hash' do
        expect(@city_id_result['city']['name']).not_to be_empty
        expect(@city_id_result['city']).to be_a(Hash)

    end

    it 'should return a vaild city name' do 
        pending 
    end

    it 'should return a vaild country code' do
        pending
    end

    it 'should have a list array' do
        expect(@city_id_array).to be_a(Array)
    end

    it 'should have a main hash' do
        expect(@city_id_array[1]).to be_a(Hash)
    end

    it 'should return temp' do
        pending

    end
    it 'should return temp_min' do
        pending

    end
    it 'should return temp_max' do
        pending

    end
    it 'should return temp as float' do
        expect(@city_id_main['main']['temp']).to be_a(Float)
        

    end
    it 'should return temp_min as float' do
        expect(@city_id_main['main']['temp_min']).to be_a(Float)
        

    end
    it 'should return temp_max as float' do
        expect(@city_id_main['main']['temp_max']).to be_a(Float)

    end
    it 'should return humidity as an integer' do
        expect(@city_id_main['main']['humidity']).to be_a(Integer)
    
    end
    it 'should return weather as an array' do
        expect(@city_id_array[1]['weather']).to be_a(Array)
    end
    
    it 'should have main in the weather hash which contains a string' do
        expect(@city_id_array[1]['weather'][0]).to be_a(Hash)
        expect(@city_id_array[1]['weather'][0]['main']).to be_a(String)
   
    end
    it 'should have description in the weather hash which contains a string' do
        expect(@city_id_array[1]['weather'][0]['description']).to be_a(String)
        
    end
    it 'should have wind speed as a float' do
        expect(@city_id_array[1]['wind']['speed']).to be_a(Float)

    end
    it 'should have wind degree as a float' do
        expect(@city_id_array[1]['wind']['deg']).to be_a(Float)
        
        
    end
    
    

end 