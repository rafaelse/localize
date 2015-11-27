class Customers::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  skip_before_filter :verify_authenticity_token, only: [:create]

      # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
     self.resource = warden.authenticate!(auth_options)
     set_flash_message(:notice, :signed_in) if is_navigational_format?
     sign_in(resource_name, resource)

     respond_to do |format|
       format.json { render :status => 200,
                            :json => { :success => true,
                                       :info => "Logged in",
                                       :data => { :auth_token => current_customer.authentication_token }}}
       format.html { respond_with resource, :location => after_sign_in_path_for(resource)}
     end
   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
