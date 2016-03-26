class PagesController < ActionController
  before_action :login_required, except: [ :index, :show ]
  before_action :role_required,  except: [ :index, :show ]

  # !!! ATTENTION !!!
  #
  # TheRole: You have to set object for ownership check
  # before check ownership via `owner_required` method
  # You can do it with `for_ownership_check(@page)` in `set_page`
  #

  before_action :set_page,       only: [ :edit, :update, :destroy ]
  before_action :owner_required, only: [ :edit, :update, :destroy ]

  private

  def set_page
    @page = Page.find params[:id]

    # TheRole: object for ownership checking
    for_ownership_check(@page)
  end

  def page_params
    permitted_keys = [:title, :intro, :content]

    permitted_keys.push(:tags)       if current_user.has_role?(:pages, :tags)
    permitted_keys.push(:top_secret) if current_user.admin?

    params.require(:page).permit(permitted_keys)
  end
end