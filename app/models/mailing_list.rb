class MailingList < ActiveRecord::Base

  def self.search(query)
    where("name like :search OR email like :search", search: "#{query}")
  end
end
