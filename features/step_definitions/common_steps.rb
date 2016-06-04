
############# Helpers
CAPTURE_INT = Transform(/^(?:-?\d+|zero|one|two|three|four|five|six|seven|eight|nine|ten)$/) do |v|
    %w(zero one two three four five six seven eight nine ten).index(v) || v.to_i
end

def validate_list(data, of: nil, count: nil)
  expect(data).to be_a_kind_of(Array)
  expect(data.count).to eq(count) unless count.nil?
  unless of.nil?
    validate_item = "validate_#{of.singularize.downcase.tr(' ', '_')}_summary".to_sym
    data.each { |item| send(validate_item, item["attributes"]) }
  end
end

def validate_element(data, of: nil, count: nil)
  unless of.nil?
    validate_item = "validate_#{of.singularize.downcase.tr(' ', '_')}".to_sym
    send(validate_item, data["attributes"])
  end
end

def get_resource(resource)
  get("/#{resource.pluralize.downcase.tr(' ', '-')}")
end

def get_single_resource(resource, id)
  get("/#{resource.pluralize.downcase.tr(' ', '-')}/#{id}")
end
