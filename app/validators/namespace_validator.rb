class NamespaceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value =~ PathRegex.root_namespace_path_regex
      record.errors.add(attribute, "has already been taken")
    end
  end
end