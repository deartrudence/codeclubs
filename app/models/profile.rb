class Profile < ActiveRecord::Base
  ROLE = %w[admin teacher]

  PROVINCES = ['British Columbia', 'Alberta', 'Saskatchewan', 'Manitoba', 'Ontario', 'Quebec', 'Nova Scotia','Newfoundland and Labrador', 'Prince Edward Island', 'North West Territories', 'Nunavut', 'Yukon']

  CSV_OPTIONS = ['email', 'first_name', 'last_name', 'school', 'province', 'gender', 'years_of_experience', 'teaching_role', 'grade', 'number_of_students', 'mailing_list']

  YEARS_OF_EXPERIENCE = ['Less than 5', '5 - 10', '10 - 15', '15 - 20', '20+' ]
  
  GRADE = ['K', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']

  TEACHING_ROLE = ['A teacher in a public school','A teacher in a private school','A teacher in an alternative school or home-school','A daycare or preschool teacher','A non-traditional educator part of a community group','Other']

  NUMBER_OF_STUDENTS = ['Less than 10','10 - 15','15 - 20',
  '20 - 25','25+']
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

    def email
      self.user.email
    end

    def self.search(query)
      where("first_name like :search OR last_name like :search", search: "#{query}")
    end

    def self.to_csv(profiles, options)
      attributes = options
      CSV.generate(headers: true) do |csv|
        csv << attributes
        profiles.each do |profile|
          csv << attributes.map{ |attr| profile.send(attr) }
        end
      end
    end

end
