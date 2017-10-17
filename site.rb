require 'sinatra'
require 'http'
require 'json'

METHOD = 'getQuote'.freeze
FORMAT = 'json'.freeze
KEY    = Random.new.rand(1..999999)
LANG   = 'en'.freeze

set :public_folder, File.join(File.dirname(__FILE__), '/static')

get '/' do
  quote = JSON.parse(HTTP.get("http://api.forismatic.com/api/1.0/?method=#{METHOD}&format=#{FORMAT}&key=#{KEY}&lang=#{LANG}").to_s)
  puts quote
  AUTHOR = quote['quoteAuthor']
  QUOTE  = quote['quoteText']
  erb :index
end
