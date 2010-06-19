APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

require 'rubygems'
require 'sinatra'
require 'haml'
require 'backports'

class Array
   # Shuffle the array
   def shuffle!
     n = length
     for i in 0...n
       r = Kernel.rand(n-i)+i
       self[r], self[i] = self[i], self[r]
     end
     self
   end

   # Return a shuffled copy of the array
   def shuffle
     dup.shuffle!
   end

   def cycle(values)
      self.each_with_index do |o, i| 
        yield(o, values[i % values.length])
      end
    end

 end

class Sweepstakr < Sinatra::Application

  set :root, APP_ROOT



  get '/' do
    

     
    @teams = [ 'Algeria', 'England','Korea DPR','Serbia','Argentina','France','Korea Republic','Slovakia','Australia','Germany','Mexico','Slovenia','Brazil','Ghana','Netherlands','South Africa','Cameroon','Greece','New Zealand','Spain','Chile','Honduras','Nigeria','Switzerland','Côte d\'Ivoire','Italy','Paraguay','Uruguay','Denmark','Japan','Portugal','USA']

    @players = ['george','paul','seb','mike','shaun','vincent','alex','toby']

    def sweep_the_stake(things,people)

      result = Hash.new { |h,k| h[k] = [] }

      things = things.shuffle
      people = people.shuffle

      people_cycle = cycle(people)
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



