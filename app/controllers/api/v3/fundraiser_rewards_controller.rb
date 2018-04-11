class Api::V3::FundraiserRewardsController < Api::BaseController

  include Api::V3::PaginationHelper
  include Api::V3::FundraiserRewardsHelper

  def index
    @collection = ::Reward.all

    @collection = filter!(@collection)
    @collection = order!(@collection)
    @collection = paginate!(@collection)
  end

end
