# frozen_string_literal: true

class Fib < ApplicationRecord
  def self.calculate_fibonacci(n)
    # n が整数型ではない、または整数型だが 0 未満であるときエラーを返す
    return { error: '無効な入力：nは正の整数でなければいけません。' } unless n.is_a?(Integer) && n.positive?

    if n == 1
      # n が 1 の場合は 1 を返す
      { result: 1 }
    else
      # n が 2 以上の場合は前項とその前項の和を返す
      # n == 2 については配列のインデックスが 0 スタートであることを考えればこちらの条件に含めても良い
      # フィボナッチ数列を格納していく配列を初期化する
      fibbonacci = [1, 1]
      # 各 n に対して前項とその前項の和を計算し、配列に格納していく
      (2..n).each do |i|
        fibbonacci[i] = fibbonacci[i - 1] + fibbonacci[i - 2]
      end

      { result: fibbonacci[n - 1] }
    end
  end
end
