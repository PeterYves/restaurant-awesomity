json.extract! resto, :id, :name, :location, :description, :image, :created_at, :updated_at
json.url resto_url(resto, format: :json)
