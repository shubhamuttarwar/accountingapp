class Customer < ApplicationRecord

	has_many :projects, dependent: :destroy
	
	validates :name, presence: true, length: {minimum: 3}
	validates :lastname, presence: true, length: {minimum: 3}
	validates :phone, presence: true, length: {is: 10}
	validates :address, presence: true, length: {minimum: 30}
	validates_format_of :email, presence: true, :with => '/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i'

    def self.search(search)
    	if search
    		Customer.where("lastname ILIKE ? OR name ILIKE ?", "%#{search}%", "%#{search}")
    	else
    		Customer.all.order("created_at DESC").limit(5)
    	end
    end

end
