require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:long) }
    it { should validate_presence_of(:lat) }
    # it { should validate_presence_of(:phone) }
  end
end
