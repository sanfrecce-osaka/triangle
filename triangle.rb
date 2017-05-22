require 'nkf'

class Triangle

  class << self

    def display_shape(line_a, line_b, line_c)
      lines = [line_a, line_b, line_c].map { |line| NKF.nkf('-m0Z1 -W -w', line).to_r }

      return '辺の長さは0より大きい整数、小数、分数を半角または全角で入力してください！' if or_less_zero?(lines)
      return '三角形じゃないです＞＜' unless triangle?(lines)

      if equilateral?(lines)
        '正三角形ですね！'
      elsif isosceles?(lines)
        '二等辺三角形ですね！'
      else
        '不等辺三角形ですね！'
      end
    end

    private

    def or_less_zero?(lines)
      check_or_less_zero(lines[0]) <= 0 || check_or_less_zero(lines[1]) <= 0 || check_or_less_zero(lines[2]) <= 0
    end

    def check_or_less_zero(line)
      line <=> 0
    end

    def triangle?(lines)
      check_triangle_condition(lines[0], lines[1], lines[2]) == 1 && check_triangle_condition(lines[1], lines[2], lines[0]) == 1 && check_triangle_condition(lines[2], lines[0], lines[1]) == 1
    end

    def check_triangle_condition(line_a, line_b, line_c)
      line_a + line_b <=> line_c
    end

    def equilateral?(lines)
      lines[0] == lines[1] && lines[1] == lines[2]
    end

    def isosceles?(lines)
      lines[0] == lines[1] || lines[1] == lines[2] || lines[2] == lines[0]
    end
  end
end

puts(Triangle.display_shape(ARGV[0], ARGV[1], ARGV[2]))
