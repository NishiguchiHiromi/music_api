# == Schema Information
#
# Table name: musics
#
#  id          :bigint(8)        not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#  no          :integer          not null
#  title       :string(255)      default("no-title")
#  composer    :string(255)      default("no-composer")
#  source      :string(255)      default("no-source")
#  meter       :string(255)      default("4/4")
#  note_length :string(255)      default("1/64")
#  tempo       :string(255)      default("1/4=80")
#  reference   :string(255)
#  key         :string(255)      default("C")
#

class Music < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy
  accepts_nested_attributes_for :notes, allow_destroy: true
end
