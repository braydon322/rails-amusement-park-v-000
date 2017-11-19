class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.tickets < self.attraction.tickets
      if self.user.height < self.attraction.min_height
        "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
      else
        "Sorry. You do not have enough tickets to ride the Roller Coaster."
      end
    else self.user.tickets > self.attraction.tickets
      self.user.tickets = self.user.tickets - self.attraction.tickets
      self.user.nausea = self.user.nausea + self.attraction.nausea_rating
      self.user.happiness = self.user.happiness + self.attraction.happiness_rating
      self.user.save
      if self.user.height < self.attraction.min_height
        "Sorry. You are not tall enough to ride the Roller Coaster."
      end
    end
  end
end
