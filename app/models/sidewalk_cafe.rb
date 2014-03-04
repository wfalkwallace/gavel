class SidewalkCafe
  include Mongoid::Document
  field :dca_id, type: Integer
  field :business_name, type: String
  field :trade_name, type: String
  field :sidewalk_cafe_type, type: String
  field :license_number, type: Integer
  field :full_address, type: String
  field :address_building, type: String
  field :address_street_name, type: String
  field :city, type: String
  field :state, type: String
  field :zip_code, type: String
  field :borough, type: String
  field :address_location, type: String
  field :phone, type: String
  field :lic_area_sqft, type: Integer
end
