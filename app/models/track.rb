class Track < ApplicationRecord

  validates :composer, :name, presence: true   #this is a method because it is accpeting arguments!
  validates :name, length: {minimum: 2}   #shouldn't be able to add a name shorter than 2 characters
  validate :name_starts_with_capital_letter

  def name_starts_with_capital_letter   # instance method
    #get first letter from self.name
    #if first letter is not capitalized, add an error
    first_letter = self.name[0]
                     #the instance that is being acted on
    if first_letter == first_letter.downcase
      self.errors.add(:name, "must start with a capitalized first letter.")
    end
  end

  def self.short
    return self.less_than(180000)
    # return self.where("milliseconds <= ?", 180000)   # we could use Track.self, but the self is implicit here
  end

  def self.long
    return self.where("milliseconds > ?", 300000)
  end

  def self.medium
    # return self.where("milliseconds > ?", 180000).where("milliseconds <= ?", 300000)
    # return self.where("milliseconds > ?", 180000).less_than(300000)
    return self.more_than(180000).less_than(300000)
  end

  def self.less_than(length)
    return self.all if length == nil
    # if length == nil
    #   return self.all
    # end
    return self.where("milliseconds <= ?", length)
  end

  def self.more_than(length)
    return self.where("milliseconds > ?", length)
  end

  # def self.compare_to(length, comparison)
  #   query = "millisecons #{comparison} ?"
  #   return
  # end

end
