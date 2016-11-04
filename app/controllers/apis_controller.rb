class ApisController < ApplicationController
  def create
    schema_string = create_params[:schema]
    schema = SchemaBuilder.build_from_definition(
      schema_string
    )
  end

  def show
  end

  private

  def create_params
    params.require(:schema)
  end
end
