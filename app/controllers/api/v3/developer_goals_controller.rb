class Api::V3::DeveloperGoalsController < Api::BaseController

  include Api::V3::PaginationHelper
  include Api::V3::DeveloperGoalsHelper

  before_action :require_auth, only: [:update, :create]

  def index
    @collection = DeveloperGoal.all

    if params[:include_owner].to_bool
      @include_developer_goal_owner = true
      @collection = @collection.includes(:person)
    end

    @collection = filter!(@collection)
    @collection = order!(@collection)
    @collection = paginate!(@collection)
  end

  def create
    issue = Issue.find(params[:issue_id])

    # see if a dev goal already exists
    # TODO: create new SolutionEvent::GoalSet instead of modifying a single record
    @item = issue.developer_goals.where(person_id: current_user.id).first

    if @item && params[:amount].blank?
      @item.destroy
      render json: {}
    elsif @item
      @item.update_attributes(amount: params[:amount])
      render 'api/v3/developer_goals/show'
    else
      @item = current_user.developer_goals.create!(issue: issue, amount: params[:amount])
      render 'api/v3/developer_goals/show'
    end
  end

  def update
    raise
    # unless (@developer_goal = @issue.developer_goals.where(person_id: @person.id).first)
    @item = current_user.addresses.create!(goal_params)
  end

end
