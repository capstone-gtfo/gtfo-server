require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations in model' do
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:latitude) }
  end
end