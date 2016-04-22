class Profile < ActiveRecord::Base
  ROLE = %w[admin teacher]
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
    default_url: "avatar.jpg"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

    scope :on_mailing_list, -> { where(mailing_list: true) }

    def is_admin?
      self.role == 'admin'
    end

    def name
      "#{first_name} #{last_name}"
    end

    def self.search(query)
      where("first_name like :search OR last_name like :search", search: "#{query}")
    end

end
