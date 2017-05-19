require File.expand_path(File.dirname(__FILE__) + '/../triangle')

describe Triangle do
  context '与えられた辺の長さが全て0より大きい場合' do
    it { expect(Triangle.display_shape(1, 2, 3)).to eq '三角形じゃないです＞＜' }
    it { expect(Triangle.display_shape(3, 1, 2)).to eq '三角形じゃないです＞＜' }
    it { expect(Triangle.display_shape(2, 3, 1)).to eq '三角形じゃないです＞＜' }
  end

  context '与えられた辺の長さに0以下が含まれている場合' do
    it { expect(Triangle.display_shape(0, 1, 1)).to eq '辺の長さは0より大きい値を入力してください！' }
    it { expect(Triangle.display_shape(1, 0, 1)).to eq '辺の長さは0より大きい値を入力してください！' }
    it { expect(Triangle.display_shape(1, 1, 0)).to eq '辺の長さは0より大きい値を入力してください！' }
  end
end
