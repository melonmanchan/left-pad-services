ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

require_relative 'server.rb'

include Rack::Test::Methods

def app
    Sinatra::Application
end


describe "Left pad" do
    it "should return json" do
        get '/'
        last_response.headers['Content-Type'].must_equal 'application/json;charset=utf-8'
    end

    it "should pad string" do
        get '/?str=paddin%27%20oswalt&len=68&ch=@'
        { str: '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@paddin\' oswalt' }.to_json.must_equal last_response.body
    end
end
