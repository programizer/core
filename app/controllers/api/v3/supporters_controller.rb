class Api::V3::SupportersController < Api::BaseController

  include Api::V3::PaginationHelper

  def index
    @team = Team.where(slug: params[:team_slug]).first!

    # compute page size
    values = calculate_pagination_offset(params)
    values[:order] = params[:order]

    @collection = @team.top_supporters(values)

    render 'api/v3/supporters/index'
  end

end
