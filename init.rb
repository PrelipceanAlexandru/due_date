Redmine::Plugin.register :due_date do
  name 'Due Date Email'
  author 'Prelipcean Alex'
  description 'Add Due Date in email notification'
  version '0.0.1'
  url ''
  author_url 'https://assist-software.net/team/alexandru-prelipcean'
end

Rails.configuration.to_prepare do
  IssuesHelper.include IssuesHelperDueDate
end
