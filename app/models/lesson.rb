class Lesson < ActiveRecord::Base
  include Bootsy::Container

  belongs_to :profile, -> { includes :user }
  delegate :user, :to => :profile, :allow_nil => true
  has_many :suggested_lessons

  acts_as_votable

  acts_as_taggable_on :subject, :code_concept, :grade

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :level, :duration_in_minutes, :description, :content, presence: true


  has_attached_file :feature_image, styles: { medium: "750x300>", thumb: "100x100>" }, default_url: "klc.jpg"
  validates_attachment_content_type :feature_image, content_type: /\Aimage\/.*\Z/

  has_attached_file :file_upload
  validates_attachment :file_upload, content_type: { content_type: "application/pdf" }

  scope :is_approved, -> { where(approved: true) }


  def short_description
    if self.description.present?
      self.description.first(300) + ' ...'
    end
  end

  def liked_by_user(current_user)
    if current_user.present?
      liked = current_user.voted_as_when_voted_for self
      if liked == nil
        return false
      else
        return liked
      end
    end
  end

  def user_owns_lesson?(current_user)
    if current_user.present?
      self.user == current_user
    else
      return false
    end
  end

  def self.search(query)
    where("title like ?", "%#{query}%")
  end


end
