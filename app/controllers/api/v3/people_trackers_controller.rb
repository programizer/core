class Api::V3::PeopleTrackersController < Api::BaseController

  include Api::V3::PaginationHelper
  include Api::V3::PeopleTrackersHelper

  before_action :parse_boolean_values

  def index
    tracker_ids = ::TrackerRelation.where(linked_account_id: current_user.linked_accounts.pluck(:id)).pluck(:tracker_id)
    @collection = ::Tracker.where(id: tracker_ids)
  end

protected

  def parse_boolean_values
    @include_description = params[:include_description].to_bool
  end

end
