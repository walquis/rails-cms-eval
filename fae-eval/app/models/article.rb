class Article < ApplicationRecord
  include Fae::BaseModelConcern
  has_fae_file :pdf

  has_fae_image :hero_image

  def fae_display_field
    title
  end

  belongs_to :article_category
end
