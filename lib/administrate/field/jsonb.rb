require 'administrate/engine'
require 'administrate/field/base'
require 'rails'

module Administrate

  module Field

    class JSONB < Administrate::Field::Base

      def transform
        return data unless options[:transform].present? && options[:transform].is_a?(Array)

        result = data
        options[:transform].each do |method|
          result = data.public_send(method)
        end
        result
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
