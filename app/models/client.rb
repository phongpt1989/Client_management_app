class Client < ApplicationRecord
  belongs_to :users

  before_validation :set_view_count

  validates :first_name, :last_name, :address, :postal_code, presence: true

  validates :phone_number, :age, presence: true, numericality: { only_integer: true }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email,
            presence: true,
            uniqueness: true,
            format: VALID_EMAIL_REGEX,
            unless: :from_oauth?

  include FriendlyId
  friendly_id :full_name, use: [:slugged, :history, :finders]

  def full_name
    "#{first_name} #{last_name}".strip

  end

end
