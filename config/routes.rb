# frozen_string_literal: true

Rails.application.routes.draw do
  # APIのエンドポイントとコントローラのメソッドを結びつける
  get '/fib', to: 'fib#calculate'
end
