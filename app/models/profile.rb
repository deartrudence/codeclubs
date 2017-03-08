class Profile < ActiveRecord::Base
  EN_ROLE = %w[admin teacher]
  FR_ROLE = %w[admin enseignant]

  # using the provinces from level - to reduce how many places we store it
  # PROVINCES = ['British Columbia', 'Alberta', 'Saskatchewan', 'Manitoba', 'Ontario', 'Quebec', 'Nova Scotia','Newfoundland and Labrador', 'Prince Edward Island', 'North West Territories', 'Nunavut', 'Yukon']

  EN_CSV_OPTIONS = ['email', 'first_name', 'last_name', 'school', 'province', 'gender', 'years_of_experience', 'teaching_role', 'grade', 'number_of_students', 'mailing_list']
  FR_CSV_OPTIONS = ['email', 'first_name', 'last_name', 'school', 'province', 'gender', 'years_of_experience', 'teaching_role', 'grade', 'number_of_students', 'mailing_list']

  EN_YEARS_OF_EXPERIENCE = ['Less than 5', '5 - 10', '10 - 15', '15 - 20', '20+' ]
  FR_YEARS_OF_EXPERIENCE = ['Moins de 5', '5 - 10', '10 - 15', '15 - 20', '20+' ]
  
  # using the provinces from level - to reduce how many places we store it
  # GRADE = ['K', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']

  EN_TEACHING_ROLE = ['A teacher in a public school','A teacher in a private school','A teacher in an alternative school or home-school','A daycare or preschool teacher','A non-traditional educator part of a community group','Other']
  FR_TEACHING_ROLE = ['Enseignant dans une école publique','Enseignant dans une école privée','Enseignant dans une école alternative ou à la maison','Éducateur en garderie ou enseignant en prématernelle','Enseignant autre dans un groupe communautaire','Autre']

  EN_NUMBER_OF_STUDENTS = ['Less than 10','10 - 15','15 - 20', '20 - 25','25+']
  FR_NUMBER_OF_STUDENTS = ['Moins de 10','10 - 15','15 - 20', '20 - 25','25+']

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
