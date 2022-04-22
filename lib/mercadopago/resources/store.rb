# typed: true
# frozen_string_literal: true

module Mercadopago
  ###
  # This class provides the methods to access the API that will allow you to create your own payment experience on your website.

  # From basic to advanced configurations, you control the whole experience.

  # [Click here for more infos](https://www.mercadopago.com.ar/developers/es/reference/stores/_stores_id/get)

  class Store < MPBase
    def search(user_id, filters: nil, request_options: nil)
      raise TypeError, 'Param filters must be a Hash' unless filters.nil? || filters.is_a?(Hash)

      _get(uri: "/users/#{user_id}/stores/search", filters: filters, request_options: request_options)
    end

    def get(store_id, request_options: nil)
      _get(uri: "/stores/#{store_id}", request_options: request_options)
    end

    def create(store_data, request_options: nil)
      raise TypeError, 'Param store_data must be a Hash' unless store_data.is_a?(Hash)

      _post(uri: '/stores/', data: store_data, request_options: request_options)
    end

    def update(user_id, store_id, store_data, request_options: nil)
      raise TypeError, 'Param store_data must be a Hash' unless store_data.is_a?(Hash)

      _put(uri: "/users/#{user_id}/stores/#{store_id}", data: store_data, request_options: request_options)
    end

    def delete(user_id, store_id, request_options: nil)
      _delete(uri: "/users/#{user_id}/stores/#{store_id}", data: store_data, request_options: request_options)
    end
  end
end
