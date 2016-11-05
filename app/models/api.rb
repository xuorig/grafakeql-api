class Api < ApplicationRecord
  def to_param
    uuid
  end
end
