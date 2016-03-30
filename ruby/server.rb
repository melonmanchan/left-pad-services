#!/usr/bin/env ruby

require 'sinatra'
require 'json'

get '/' do
    str = params['str'] || ""
    ch  = params['ch']
    len = params['len']


    {str: str}.to_json
end
