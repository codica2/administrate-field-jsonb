require 'administrate/engine'
require 'administrate/field/base'
require 'rails'

module Administrate

  module Field

    class JSONB < Administrate::Field::Base

      def transform
        return nil if data.blank?
        return data unless options[:transform].present? && options[:transform].is_a?(Array)

        result = data
        options[:transform].each do |method|
          result = if method == :parse_json
                     JSON.parse(result) rescue result
                   elsif result.is_a?(Array)
                     result.map(&method)
                   elsif method.is_a?(Proc)
                     method.call(result)
                   else
                     result.public_send(method)
                   end
        end
        result
      end

      def array?
        transform.is_a?(Array)
      end

      def advanced_view?
        advanced_view.present? && advanced_view.is_a?(Hash)
      end

      def advanced_view
        options[:advanced_view]
      end

      def to_partial_path(partial = page)
        "/fields/jsonb/#{partial}"
      end

      def blank_sign
        options[:blank_sign] || '-'
      end

      class Engine < ::Rails::Engine

        Administrate::Engine.add_javascript 'administrate-field-jsonb/application'
        Administrate::Engine.add_stylesheet 'administrate-field-jsonb/application'

        engine_root = root

        isolate_namespace Administrate
        config.to_prepare do
          Rails.application.config.assets.paths << engine_root.join('vendor', 'assets', 'images')
        end

      end

    end

  end

end
