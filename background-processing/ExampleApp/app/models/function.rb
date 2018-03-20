class Function < ApplicationRecord
  include AASM

  extend Enumerize
  enumerize :status, in:[:'active', :'inactive'], default: :'active'

  aasm :column => 'status' do
  	state :active, :initial => true
    state :inactive

    event :deactivate do
      transitions :from => :active, :to => :inactive
    end
    event :activate do
      transitions :from => :inactive, :to => :active 
    end
  end
end
