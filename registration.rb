class Registration < ApplicationRecord
  CLUBS = ["Artistic Club", "Drama Club", "Music Club", "Sports Club", "Cinematography Club", "Social Services Club", "Culinary Arts Club"].freeze
  validates :student_name, :student_class, :section, :email, :club, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :club, inclusion: { in: CLUBS }
  validate :maximum_seventy_students

  private
  def maximum_seventy_students
    errors.add(:base, "The demo is limited to 70 student registrations.") if new_record? && Registration.count >= 70
  end
end
