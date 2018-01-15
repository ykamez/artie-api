module Auth
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    private

      def sign_up_params
        params.permit(:name, :email, :display_name, :image_data, :password, :password_confirmation)
      end

      def account_update_params
        params.permit(:name, :email, :display_name, :image_data, :password, :password_confirmation)
      end
  end
end
