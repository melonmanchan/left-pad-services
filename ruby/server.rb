#!/usr/bin/env ruby

require 'sinatra'
require 'json'

require_relative 'left-pad'

get '/' do
    str = params['str'] || ""
    ch  = params['ch']
    len = params['len']

    { str: LeftPad.leftPad(str, len, ch) }.to_json
end
