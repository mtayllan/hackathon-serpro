class Organization < ApplicationRecord
  has_one :address, dependent: :destroy

  enum kind: {
    public_hospital: 0,
    private_hospital: 1,
    clinic: 2,
    upa: 3
  }
end