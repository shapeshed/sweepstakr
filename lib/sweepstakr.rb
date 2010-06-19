APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

require 'rubygems'
require 'sinatra'
require 'haml'

class Sweepstakr < Sinatra::Application

  set :root, APP_ROOT

  class Array
    def shuffle
      sort_by { rand }
    end

    end shuffle!
      replace shuffle
    end
  end

  get '/' do
    

     
    @teams = [ 'Algeria', 'England','Korea DPR','Serbia','Argentina','France','Korea Republic','Slovakia','Australia','Germany','Mexico','Slovenia','Brazil','Ghana','Netherlands','South Africa','Cameroon','Greece','New Zealand','Spain','Chile','Honduras','Nigeria','Switzerland','Côte d\'Ivoire','Italy','Paraguay','Uruguay','Denmark','Japan','Portugal','USA']

    @players = ['george','paul','seb','mike','shaun','vincent','alex','toby']

    def sweep_the_stake(things,people)
      
      result = Hash.new { |h,k| h[k] = [] }

      things = things.shuffle
      people = people.shuffle

      people_cycle = people.cycle
      things.each do |thing|
         person = people_cycle.next
         result[person] << thing
      end

      result
    end
    
    @results = sweep_the_stake(@teams,@players)
    
    haml :index
  end



end



