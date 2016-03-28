module Backend
  class ReportsController < Backend::ApplicationController
    soap_service namespace: 'urn:WashOut'
    soap_action "integer_to_string",
              :args   => :integer,
              :return => :string
    def integer_to_string
        render :soap => params[:value].to_s
    end

    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Report.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Report.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
    before_filter :dump_parameters
    def dump_parameters
      Rails.logger.debug params.inspect
    end
  end   
end
