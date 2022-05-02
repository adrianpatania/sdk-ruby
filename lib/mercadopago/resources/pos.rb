# typed: true
# frozen_string_literal: true

module Mercadopago
  ###
  # This class provides the methods to access the API that will allow you to create your own payment experience on your website.

  # From basic to advanced configurations, you control the whole experience.

  # [Click here for more infos](https://www.mercadopago.com.ar/developers/es/reference/pos/_pos/post)

  class Pos < MPBase
    def search(filters: nil, request_options: nil)
      raise TypeError, 'Param filters must be a Hash' unless filters.nil? || filters.is_a?(Hash)

      _get(uri: "/pos", filters: filters, request_options: request_options)
    end

    def get(pos_id, request_options: nil)
      _get(uri: "/pos/#{pos_id}", request_options: request_options)
    end

    def create(pos_data, request_options: nil)
      raise TypeError, 'Param pos_data must be a Hash' unless pos_data.is_a?(Hash)

      _post(uri: '/pos', data: pos_data, request_options: request_options)
    end

    def update(pos_id, pos_data, request_options: nil)
      raise TypeError, 'Param pos_data must be a Hash' unless pos_data.is_a?(Hash)

      _put(uri: "/pos/#{pod_id}", data: pos_data, request_options: request_options)
    end

    def delete(pos_id, request_options: nil)
      _delete(uri: "/pos/#{pos_id}", data: pos_data, request_options: request_options)
    end

    def order(user_id, external_store_id, external_pos_id, payment_data, request_options: nil)
      _put(uri: "/instore/qr/seller/collectors/#{user_id}/stores/#{external_store_id}/pos/#{external_pos_id}/orders", data: payment_data, request_options: request_options)
    end
  end
end
