require "test_helper"

class DocumentTest < ActiveSupport::TestCase
  test "should return its id column name" do
    d = documents(:one)
    id_field = fields(:id_column)
    assert_equal d.id_column, id_field.name
  end
end
