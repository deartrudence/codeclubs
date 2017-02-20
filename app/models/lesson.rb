class Lesson < ActiveRecord::Base
  include Bootsy::Container

  belongs_to :profile, -> { includes :user }
  delegate :user, :to => :profile, :allow_nil => true
  has_many :suggested_lessons, :dependent => :destroy

  has_many :lesson_references, :dependent => :destroy
  accepts_nested_attributes_for :lesson_references, allow_destroy: true

  acts_as_votable

  acts_as_taggable_on :subject, :code_concept

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :level, :duration_in_minutes, :description, :content, :province, presence: true


  has_attached_file :feature_image, styles: { medium: "750x300>", thumb: "100x100>" }, default_url: "klc.jpg"
  validates_attachment_content_type :feature_image, content_type: /\Aimage\/.*\Z/

  has_attached_file :file_upload
  validates_attachment :file_upload, content_type: { content_type: "application/pdf" }

  scope :is_approved, -> { where(approved: true) }

  scope :has_been_submitted?, -> (status) { where submitted: status }

  scope :order_asc, -> { where( submitted: false ).order("title asc") }

  scope :is_verified?, -> { where( verified: true ) }

  GRADE = ['K', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']

  PROVINCES = ['All','British Columbia', 'Alberta', 'Saskatchewan', 'Manitoba', 'Ontario', 'Quebec', 'Nova Scotia','Newfoundland and Labrador', 'Prince Edward Island', 'North West Territories', 'Nunavut', 'Yukon']

  CURRICULUM_SUBJECTS = ['The Arts','French As a Second Language', 'English Language Arts','Health and Physical Education','Mathematics','Native Languages','Science','Technology Education','Social Studies','Career Education'] 

  CODING_CONCEPTS = ['Algorithms', 'Arrays',  'Boolean Logic','Conditional statements','Debugging','Events','Functions','Loops','Operators','Parallel Execution','Random Numbers', 
  'Sequences','States','Variables']

  def short_description
    if self.description.present?
      self.description.first(300) + ' ...'
    end
  end

  def author
    self.user.profile.name
  end

  def status
    approved ? 'public' : 'pending'
  end

  def verified?
    verified ? 'Y' : 'N'
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

  def format_date(date)
    date.strftime("%-d/%-m/%C")
  end


end
