module ArticlesHelper
  def find_mp(id)
    mp = Mp.find(id)
    return mp
  end
end
