class Api::V1::ItemsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # skip_before_action :check_login # so that guest can see

  def favorite
    render json: {name: 'aaa', age: 18}
  end
end
