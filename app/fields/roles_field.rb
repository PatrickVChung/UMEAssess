require "administrate/field/base"
# app/fields/roles_field.rb
require "yaml"

class RolesField < Administrate::Field::Base
  def role_selected?(role_name)
    current_roles = resource.send(attribute)
    return false if current_roles.blank?

    # If it's a YAML string from the database, deserialize it into an array
    if current_roles.is_a?(String)
      begin
        current_roles = YAML.safe_load(current_roles, permitted_classes: [Symbol])
      rescue Psych::SyntaxError
        current_roles = []
      end
    end

    # Normalize single symbol/string or arrays into a clean Array of Strings
        normalized_list = case current_roles
                          when Array
                            current_roles
                          when Symbol, String
                            [current_roles]
                          else
                            Array(current_roles)
                          end

        roles_array = normalized_list.flatten.compact.map(&:to_s)

    roles_array.include?(role_name.to_s)
  end
end
