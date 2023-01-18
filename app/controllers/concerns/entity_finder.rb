module EntityFinder
  extend ActiveSupport::Concern

  def find_entity(model, id)
    model.capitalize.constantize.find(id)
  end
end
