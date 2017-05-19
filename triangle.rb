class Triangle
  class << self
    def display_shape(line_a, line_b, line_c)
      '辺の長さは0より大きい値を入力してください！' if or_less_zero?(line_a, line_b, line_c)
    end

    private

    def or_less_zero?(line_a, line_b, line_c)
      line_a <= 0 || line_b <= 0 || line_c <= 0
    end
  end
end
