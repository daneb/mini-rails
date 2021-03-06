# lib/relation.rb

module ActiveRecord
  class Relation
    def initialize(klass)
      @klass = klass
      @where_values = []
    end

    def where!(condition)
      @where_values += [condition]
      self
    end

    def where(condition)
      clone.where!(condition)
    end

    def to_sql
      sql = "SELECT * FROM #{@klass.table_name}"

      sql += " WHERE " + @where_values.join(" AND ") if @where_values.any?

      sql
    end

    def records
      @records ||= @klass.find_by_sql(to_sql)
    end

    def first
      records.first
    end
  end
end
