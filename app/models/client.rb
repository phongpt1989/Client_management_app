class Client < ApplicationRecord
  belongs_to :user

  has_many :health_histories, dependent: :destroy

  has_many :categorizings, dependent: :destroy
  has_many :categories, through: :categorizings

  has_many :services, dependent: :destroy
  has_many :service_records, dependent: :nullify

  validates :first_name, :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email,
            # presence: true,
            uniqueness: true,
            format: VALID_EMAIL_REGEX

end
