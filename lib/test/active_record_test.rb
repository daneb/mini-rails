require_relative "test_helper"

class ActiveRecordTest < Minitest::Test
  def test_initialize
    post = Post.new(id: 1, title: "My first post")
    assert_equal 1, post.id
    assert_equal "My first post", post.title
  end

  def test_find
    post = Post.find(1)
    assert_kind_of Post, post
    assert_equal 1, post.id
    assert_equal "Blueberry Muffins", post.title
  end

  def test_all
    post = Post.all.first
    assert_kind_of Post, post
    assert_equal 1, post.id
    assert_equal "Blueberry Muffins", post.title
  end

  def test_execute_sql
    rows = Post.connection.execute("SELECT * from posts")
    assert_kind_of Array, rows
    row = rows.first
    assert_kind_of Hash, row
    assert_equal %i[id title body created_at updated_at], row.keys
  end

  def test_where
    relation = Post.where("id = 2").where("title IS NOT NULL")
    assert_equal "SELECT * FROM posts WHERE id = 2 AND title IS NOT NULL", relation.to_sql
    post = relation.first
    assert_equal 2, post.id
  end
end
