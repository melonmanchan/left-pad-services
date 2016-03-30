#!/usr/bin/env ruby

require 'sinatra'
require 'json'

require_relative 'left-pad'

get '/' do
    str = params['str'] || ""
    ch  = params['ch']  || ""
    len = params['len'] || 0

    content_type :json, 'charset' => 'utf-8'
    { str: LeftPad.leftPad(str, len, ch) }.to_json
end
