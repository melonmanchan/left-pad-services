#!/usr/bin/env ruby

require 'sinatra'
require 'json'

require_relative 'left-pad'

set :port, 3000

get '/' do
    str = params['str'] || ""
    ch  = params['ch']  || " "
    len = params['len'] || 0

    ch = " " if params['ch'].nil? || params['ch'].empty?

    content_type :json, 'charset' => 'utf-8'
    { str: LeftPad.leftPad(str, len, ch) }.to_json
end
