class Api::V3::BackersController < Api::BaseController

  include Api::V3::PaginationHelper
  include Api::V3::BackersHelper

  def index
    @collection = top_backers(params)
  end

end
