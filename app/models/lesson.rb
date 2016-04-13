class Lesson < ActiveRecord::Base
  belongs_to :profile

  acts_as_votable

  acts_as_taggable_on :subject, :code_concept, :grade

  has_attached_file :feature_image, styles: { medium: "750x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :feature_image, content_type: /\Aimage\/.*\Z/

  has_attached_file :file_upload
  validates_attachment :file_upload, content_type: { content_type: "application/pdf" }
end
