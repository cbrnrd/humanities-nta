require 'sinatra'
require 'http'

METHOD = 'getQuote'.freeze
FORMAT = 'text'.freeze
KEY    = Random.new.rand(1..999999)
LANG   = 'en'.freeze

set :public_folder, File.join(File.dirname(__FILE__), '/static')

get '/' do
  quote = HTTP.get("http://api.forismatic.com/api/1.0/?method=#{METHOD}&format=#{FORMAT}&key=#{KEY}&lang=#{LANG}").to_s
  puts quote
  AUTHOR = quote.split('  ')[1].gsub!('(', '').gsub!(')', '')
  QUOTE  = quote.split('  ')[0]
  erb :index
end
