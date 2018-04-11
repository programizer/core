class Api::V3::BountiesController < Api::BaseController

  include Api::V3::PaginationHelper
  include Api::V3::BountiesHelper

  def index
    @collection = Bounty.not_refunded

    if params[:include_owner].to_bool
      @include_bounty_owner = true
      @collection = @collection.includes(:owner, :person)
    end

    @collection = filter!(@collection)
    @collection = order!(@collection)
    @collection = paginate!(@collection)
  end

  def summary
    @collection = Bounty.summary(Team.where(slug: params[:owner_team]).first!)
    
  end

end
