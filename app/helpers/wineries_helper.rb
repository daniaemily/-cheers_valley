module WineriesHelper
  def wineries_helper(winery)
    winery.photo.present? ? winery.photo : ""
  end
end
