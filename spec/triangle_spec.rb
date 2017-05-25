require File.expand_path(File.dirname(__FILE__) + '/../triangle')

describe Triangle do
  context '引数が半角数字のみの場合' do
    context '与えられた辺の長さが全て0より大きい場合' do
      context '2辺の長さの合計が残りの1辺の長さより大きい場合' do
        context '3辺の長さが全て同一の場合' do
          it { expect(Triangle.display_shape('1', '1', '1')).to eq '正三角形ですね！' }
        end

        context '3辺のうち2辺の長さが同一の場合' do
          it { expect(Triangle.display_shape('1', '2', '2')).to eq '二等辺三角形ですね！' }
          it { expect(Triangle.display_shape('2', '1', '2')).to eq '二等辺三角形ですね！' }
          it { expect(Triangle.display_shape('2', '2', '1')).to eq '二等辺三角形ですね！' }
        end

        context '3辺の長さが全て異なる場合' do
          it { expect(Triangle.display_shape('2', '3', '4')).to eq '不等辺三角形ですね！' }
        end
      end

      context '2辺の長さの合計が残りの1辺の長さ以下の場合' do
        it { expect(Triangle.display_shape('1', '2', '3')).to eq '三角形じゃないです＞＜' }
        it { expect(Triangle.display_shape('3', '1', '2')).to eq '三角形じゃないです＞＜' }
        it { expect(Triangle.display_shape('2', '3', '1')).to eq '三角形じゃないです＞＜' }
      end
    end

    context '与えられた辺の長さに0以下が含まれている場合' do
      it { expect(Triangle.display_shape('0', '1', '1')).to eq '辺の長さは0より大きい整数、小数、分数を半角または全角で入力してください！' }
      it { expect(Triangle.display_shape('1', '0', '1')).to eq '辺の長さは0より大きい整数、小数、分数を半角または全角で入力してください！' }
      it { expect(Triangle.display_shape('1', '1', '0')).to eq '辺の長さは0より大きい整数、小数、分数を半角または全角で入力してください！' }
    end
  end

  context '引数に全角数字を含む場合' do
    it { expect(Triangle.display_shape('１', '1', '1')).to eq '正三角形ですね！' }
    it { expect(Triangle.display_shape('1', '１', '1')).to eq '正三角形ですね！' }
    it { expect(Triangle.display_shape('1', '１', '１')).to eq '正三角形ですね！' }
  end

  context '引数に小数を含む場合' do
    it { expect(Triangle.display_shape('０．１', '0.7', '0.8')).to eq '三角形じゃないです＞＜' }
    it { expect(Triangle.display_shape('0.8', '0.1', '０．７')).to eq '三角形じゃないです＞＜' }
    it { expect(Triangle.display_shape('0.7', '０．８', '0.1')).to eq '三角形じゃないです＞＜' }
  end

  context '引数に分数を含む場合' do
    it { expect(Triangle.display_shape('１／１０', '7/10', '8/10')).to eq '三角形じゃないです＞＜' }
    it { expect(Triangle.display_shape('8/10', '1/10', '７／１０')).to eq '三角形じゃないです＞＜' }
    it { expect(Triangle.display_shape('7/10', '８／１０', '1/10')).to eq '三角形じゃないです＞＜' }
  end

  context '引数に整数、小数、分数以外を含む場合' do
    it { expect(Triangle.display_shape('異常値', '1', '1')).to eq '辺の長さは0より大きい整数、小数、分数を半角または全角で入力してください！' }
    it { expect(Triangle.display_shape('1', '異常値', '1')).to eq '辺の長さは0より大きい整数、小数、分数を半角または全角で入力してください！' }
    it { expect(Triangle.display_shape('1', '1', '異常値')).to eq '辺の長さは0より大きい整数、小数、分数を半角または全角で入力してください！' }
  end
end
