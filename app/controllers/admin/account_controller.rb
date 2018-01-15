module Admin
  class AccountController < AdminController

    def edit

    end

    def update_info
      if current_user.update(author_info_params)
        flash[:success] = 'Successfully saved info.'
      else
        flash[:danger] = current_user.display_error_messages
      end
      redirect_to admin_account_path
    end

    def change_password
      user = current_user
      if user.valid_password?(admin_password_params[:current_password])
        if user.change_password(admin_password_params)
          sign_in(author, bypass: true)
          flash[:success] = 'Successfully changed password.'
        else
          flash[:danger] = author.display_error_messages
        end
      else
        flash[:danger] = 'Current password was incorrect.'
      end
      redirect_to admin_account_path
    end

    def increase_money
      money_state = params[:money]
      current_user.money_state += money_state.to_i
      current_user.save()
      redirect_to admin_account_path
    end

    private

    def author_info_params
      params.require(:admin).permit(:name, :email, :birthdate)
    end

    def author_password_params
      params.require(:admin).permit(:current_password, :new_password, :new_password_confirmation)
    end

  end
end
