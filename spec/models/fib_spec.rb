# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fib, type: :model do
  describe '#calculate_fibbonacci' do
    context '無効な入力であり' do
      it '非整数である場合、エラーを返す' do
        result = Fib.calculate_fibonacci('invalid')
        expect(result).to eq({ error: '無効な入力：nは正の整数でなければいけません。' })
      end

      it '負の数である場合、エラーを返す' do
        result = Fib.calculate_fibonacci(-1)
        expect(result).to eq({ error: '無効な入力：nは正の整数でなければいけません。' })
      end

      it 'ゼロである場合、エラーを返す' do
        result = Fib.calculate_fibonacci(0)
        expect(result).to eq({ error: '無効な入力：nは正の整数でなければいけません。' })
      end
    end

    context '有効な入力であり' do
      it 'nが1の場合、正しい結果を返す' do
        result = Fib.calculate_fibonacci(1)
        expect(result).to eq({ result: 1 })
      end

      it 'nが1より大きい場合、正しい結果を返す' do
        result = Fib.calculate_fibonacci(5)
        expect(result).to eq({ result: 5 })
      end
    end
  end
end
