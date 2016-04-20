class MailingList < ActiveRecord::Base

  def self.search(query)
    where("name like :search OR email like :search", search: "#{query}")
  end

  def self.export_csv(emails)
    column_names = ['Name', 'Email', 'Opt In']
    CSV.generate(headers: true) do |csv|
      csv << column_names
      emails.each do |mailer|
        csv << [mailer.name, mailer.email, mailer.opt_in]
      end
    end
  end

end
