#=============================================================================
#
#  Name:       Tickle
#  Author:     Joshua Lippiner
#  Purpose:    Parse natural language into recuring intervals
#
#=============================================================================


$LOAD_PATH.unshift(File.dirname(__FILE__))     # For use/testing when no gem is installed

require 'date'
require 'time'
require 'chronic'

require 'tickle/tickle'
require 'tickle/handler'
require 'tickle/repeater'
require_relative "tickle/tickled.rb"
require_relative "ext/array.rb"
require_relative "ext/date_and_time.rb"
require_relative "ext/string.rb"

# Tickle is a natural language parser for recurring events.
module Tickle


  def self.parse(asked, options = {})
    # check to see if a datetime was passed
    # if so, give it back
    # TODO Consider converting to a Tickled
    case asked
    when Date, DateTime, Time then asked
    else
      tickled = Tickled.new asked, options
      _parse tickled
    end
  end


  def self.is_date(str)
    begin
      Date.parse(str.to_s)
      return true
    rescue Exception => e
      return false
    end
  end
end
