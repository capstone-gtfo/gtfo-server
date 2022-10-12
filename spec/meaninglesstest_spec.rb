require 'rails_helper'

RSpec.describe 'C/I Pipelinetest' do
  it 'Should do the thing for the things we dont know anything about' do
    expect(circle_ci).to be_successful
  end
end
