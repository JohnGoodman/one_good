class Need < ActiveRecord::Base
  belongs_to :user
  has_many :need_categories
  has_many :categories, through: :need_categories
  has_many :help_offers

  accepts_nested_attributes_for :need_categories

  validates :title, :body, presence: true
  validate :at_least_one_need_category

  scope :recent, -> { where(created_at: (Date.today - 4.weeks)..(Date.today + 2.day))}

  def at_least_one_need_category
		errors.add(:base, 'Your Need must have at least one category') if self.need_categories.blank?
  end

  def creator_name
    user.name
  end

  def creator_location
    'Clarkston, GA'
  end
end
