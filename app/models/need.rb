class Need < ActiveRecord::Base
  belongs_to :user
  has_many :need_categories
  has_many :categories, through: :need_categories
  has_many :help_offers

  accepts_nested_attributes_for :need_categories

  validates :title, :body, presence: true
  validate :at_least_one_need_category
  validate :not_too_many_need_category

  scope :recent, -> { where(created_at: (Date.today - 4.weeks)..(Date.today + 2.day))}

  def self.search(params, current_user)
    if params[:filter].present?
      category_id = Category.find_by(title: params[:filter]).id
      Need.joins(:categories).where(:categories => {id: category_id})
    elsif params[:my_needs].present?
      current_user.needs
    else
      self.recent
    end
  end

  def help_offers_count
    help_offers.count
  end

  def at_least_one_need_category
		errors.add(:base, 'Your Need must have at least one category') if self.need_categories.blank?
  end

  def not_too_many_need_category
    errors.add(:base, 'Please choose a max of three categories') if self.need_categories.count > 3
  end

  def creator_name
    user.name
  end

  def creator_location
    'Clarkston, GA'
  end

  def is_current_users(current_user)
    user == current_user
  end
end
