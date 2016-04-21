class MyDevise::RegistrationsController < Devise::RegistrationsController


    def after_sign_up_path_for(resource)
        new_profile_path
    end

    # def after_sign_in_path_for(resource)
    #   if !resource.employer.present? and !resource.job_seeker.present?
    #     if resource.role == 'employer'
    #       redirect_to new_employer_path
    #     elsif resource.role == 'job_seeker'
    #       redirect_to new_job_seeker_path
    #     else
    #       redirect_to root
    #     end
    #   end
    # end
  # def create
  #   super #this calls Devise::RegistrationsController#create

  #   if resource.save
  #     if role = 'employer'
  #       redirect_to new_employer_path
  #       return
  #     else
  #       redirect_to new_job_seeker_path
  #       return
  #     end
  #   end
  # end

  # def destroy
  #   super #this calls Devise::RegistrationsController#destroy
  #   if resource.destroy
  #     if resource.role = 'employer'
 #        Employer.find_by(user_id: resource.id).destroy
 #      else
 #        JobSeeker.find_by(user_id: resource.id).destroy
 #      end
 #    end
 #  end



end
