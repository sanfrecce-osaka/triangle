require 'nkf'

class Triangle

  class << self

    def display_shape(line_a, line_b, line_c)
      lines = [line_a, line_b, line_c].map do |line|
        NKF.nkf('-m0Z1 -W -w', line).to_i
      end

      return '辺の長さは0より大きい値を入力してください！' if or_less_zero?(lines)
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
      lines[0] <= 0 || lines[1] <= 0 || lines[2] <= 0
    end

    def triangle?(lines)
      lines[0] + lines[1] > lines[2] && lines[1] + lines[2] > lines[0] && lines[2] + lines[0] > lines[1]
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
