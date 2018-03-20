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

  def self.check
  	puts "#{Time.zone.now} | Cheking date_entry value..."
  	
  	@function = Function.all
  	@function.each do |f|
  		if f.date_entry < Time.zone.now && f.status != 'inactive'
  			if f.may_deactivate? 
  				puts "Function: #{f.name} #{f.date_entry} pasará a estar inactivo."
  				f.deactivate!
  			end
  		end
  	end
  	puts "#{Time.zone.now} | End check."
  end
end
