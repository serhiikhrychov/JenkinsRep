When(/^I fill in all fields with data:$/) do |table|
  table.hashes.each do |rule|

    rule_name = rule[:rule_name]
    division = rule[:division]
    role = rule[:role]
    site = rule[:site]

    @optimize_hit.rules_based_assignment_pop_up.rule_name.set rule_name if rule_name
    @optimize_hit.rules_based_assignment_pop_up.division.select(division)
    @optimize_hit.rules_based_assignment_pop_up.role.select(role)
    @optimize_hit.rules_based_assignment_pop_up.site.select(site)

  end

end

When(/^I select '(.*)' in 'Apply Division' dropdown$/) do |division|
  @optimize_hit.rules_based_assignment_pop_up.apply_division.select(division)
end

Then(/^I see the following data in the table:$/) do  |table_data|
    table_data = table_data.raw.flatten
table_data.each do |content|
  @optimize_hit.rules_based_assignment_pop_up.table_data.should have_content(content)
end
end

