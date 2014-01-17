require 'rack/protection'
require './app/shiori'

use Rack::Session::Cookie, secret: 'secret_key'
use Rack::Protection, raise: true
use Rack::Protection::AuthenticityToken

run Shiori
