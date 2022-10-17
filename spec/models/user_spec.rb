require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:long) }
    it { should validate_presence_of(:lat) }
    it { should validate_length_of(:phone).is_at_least(10).is_at_most(11).on(:create) }
  end
end
