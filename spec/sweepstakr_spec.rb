require 'spec_helper'

describe 'Sweepstakr' do

  
  it 'should get /' do
    get '/'
    last_response.should be_ok
  end

end