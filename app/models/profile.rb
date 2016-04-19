class Profile < ActiveRecord::Base
  has_many :lessons
  belongs_to :user
  validates :user, presence: true

  extend FriendlyId
  friendly_id :first_name, use: :slugged

  has_attached_file :avatar,
    styles: {
          thumbnail: '100x100^',
          header: '500x500^'
        },
        convert_options: {
          thumbnail: " -gravity center -crop '100x100+0+0'",
          header: " -gravity center -crop '500x500+0+0'"
        },
    default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

    def is_admin?
      self.role == 'admin'
    end

end
