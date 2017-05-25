require 'nkf'

class Triangle

  class << self

    def display_shape(line_a, line_b, line_c)
      lines = [line_a, line_b, line_c].map { |line| NKF.nkf('-m0Z1 -W -w', line).to_r }

      return '辺の長さは0より大きい整数、小数、分数を半角または全角で入力してください！' if zero_or_negative?(lines)
      return '三角形じゃないです＞＜' unless triangle?(lines)

      if equal_all_lengths?(lines)
        '正三角形ですね！'
      elsif equal_two_lengths?(lines)
        '二等辺三角形ですね！'
      else
        '不等辺三角形ですね！'
      end
    end

    private

    def zero_or_negative?(lines)
      # 別の書き方 !lines.all?(&:positive?)
      lines.any? { |line| line <= 0 }
    end

    def triangle?(lines)
      (lines[0] + lines[1] > lines[2]) && (lines[1] + lines[2] > lines[0]) && (lines[2] + lines[0] > lines[1])
    end

    def equal_all_lengths?(lines)
      lines.uniq.size == 1
    end

    def equal_two_lengths?(lines)
      lines.uniq.size <= 2
    end
  end
end

puts(Triangle.display_shape(ARGV[0], ARGV[1], ARGV[2]))
