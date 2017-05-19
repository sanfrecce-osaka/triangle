class Triangle
  class << self
    def display_shape(line_a, line_b, line_c)
      return '辺の長さは0より大きい値を入力してください！' if or_less_zero?(line_a, line_b, line_c)
      '三角形じゃないです＞＜' unless triangle?(line_a, line_b, line_c)
    end

    private

    def or_less_zero?(line_a, line_b, line_c)
      line_a <= 0 || line_b <= 0 || line_c <= 0
    end

    def triangle?(line_a, line_b, line_c)
      line_a + line_b > line_c && line_b + line_c > line_a && line_c + line_a > line_b
    end
  end
end
