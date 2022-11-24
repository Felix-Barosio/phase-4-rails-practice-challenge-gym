class Client < ApplicationRecord

    validates :name, presence: true
    validates :age, presence: true

    has_many :memberships, dependent: :destroy
    has_many :gyms, through: :memberships

    def total_membership
        all = 0
        self.memberships.each do |member|
            all += member.charge
        end

        return all
    end

end
