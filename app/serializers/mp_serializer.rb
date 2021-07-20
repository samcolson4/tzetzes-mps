class MpSerializer < ActiveModel::Serializer

  attributes :id, :name, :constituency, :majority, :first_elected, :elections_won, :mp_website_url

end
