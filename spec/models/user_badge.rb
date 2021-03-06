require 'spec_helper'
require_dependency 'user_badge'

describe UserBadge do

  it { should belong_to :badge }
  it { should belong_to :user }
  it { should belong_to :granted_by }

  context 'validations' do
    before(:each) { BadgeGranter.grant(Fabricate(:badge), Fabricate(:user)) }

    it { should validate_presence_of(:badge_id) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:granted_at) }
    it { should validate_presence_of(:granted_by) }
    it { should validate_uniqueness_of(:badge_id).scoped_to(:user_id) }
  end

end
