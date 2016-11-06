require 'securerandom'

class ApisController < ApplicationController
  def create
    api = Api.create(
      schema_definition: params[:schema_definition],
      uuid: SecureRandom.uuid
    )

    render json: { id: api.uuid }, status: :created
  end

  def show
    api = Api.find_by_uuid(params[:uuid])
    render json: api
  end

  def query
    api = Api.find_by_uuid(params[:uuid])

    schema = SchemaBuilder.build_from_definition(api.schema_definition)

    result = schema.execute(
      params[:query],
      variables: ensure_hash(params[:variables])
    )

    puts result
    render json: result
  end

  private

  def ensure_hash(query_variables)
    if query_variables.blank?
      {}
    elsif query_variables.is_a?(String)
      JSON.parse(query_variables, quirks_mode: true)
    else
      query_variables
    end
  end
end
