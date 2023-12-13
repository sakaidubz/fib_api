# frozen_string_literal: true

class FibController < ApplicationController
  def calculate
    # リクエストパラメータから整数 n を取得する
    n = params[:n].to_i

    # モデルメソッドを用いてフィボナッチ数列の n 番目を計算する
    calculate_result = Fib.calculate_fibonacci(n)

    if calculate_result.key?(:error)
      # エラーであれば、HTTPステータスコード400 (Bad Request) でエラーレスポンスを返す
      render json: {
        status: 400,
        message: calculate_result[:error]
      }, status: :bad_request
    else
      # 正常に計算がされたら結果をJSON形式で返す
      render json: {
        result: calculate_result[:result]
      }
    end
  end
end
