# == Schema Information
#
# Table name: notes
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  music_id   :integer          not null
#  bar_order  :integer          not null
#  note_order :integer          not null
#  note       :string(255)      default("C")
#  length     :integer          default(8)
#

require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
