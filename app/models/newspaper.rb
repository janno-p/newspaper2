class Newspaper < ActiveRecord::Base
  attr_accessor :founded_at_str

  validates :name, presence: { message: 'Ajalehe nimi on kohustuslik märkida.' },
                   length: { maximum: 50, message: 'Ajalehe nimi võib olla maksimaalselt 50 sümbolit pikk.' }
  validates :founded_at, :founded_at_str, presence: { message: 'Ajalehe esimese väljaande kuupäev on kohustuslik märkida.' }

  validates_each :founded_at_str do |record, attr, value|
    unless record.errors[:founded_at_str].any?
      date = Date.strptime(value, "%d.%m.%Y") rescue false
      record.errors.add(attr, 'Ajalehe esimese väljaande kuupäev on vigasel kujul.') unless date
    end
  end

  before_save :assign_founded_at

  def assign_founded_at
    unless self.founded_at_str.nil?
      self.founded_at = Date.strptime(self.founded_at_str, "%d.%m.%Y")
    end
  end

  def founded_at_value
    founded_at_str || founded_at.strftime("%d.%m.%Y")
  end
end
