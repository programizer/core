class Api::V3::CurrenciesController < ApplicationController

  def index
    render json: Currency.index, status: :ok
  end

end
