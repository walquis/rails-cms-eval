module Admin
  class ContentBlocksController < Fae::StaticPagesController

    private

    def fae_pages
      [AboutUsPage, HomePage]
    end
  end
end
