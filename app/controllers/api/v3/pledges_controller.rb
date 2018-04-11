class Api::V3::PledgesController < Api::BaseController

  include Api::V3::PaginationHelper
  include Api::V3::PledgesHelper

  def index
    @collection = ::Pledge.all

    if params[:include_owner].to_bool
      @include_owner = true
      @collection = @collection.includes(:owner, :person)
    end

    @collection = filter!(@collection)
    @collection = order!(@collection)
    @collection = paginate!(@collection)
  end

end
