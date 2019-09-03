module IssuesHelperDueDate
  def self.included(base) # :nodoc:
    base.send(:prepend, InstanceMethods)

    base.module_eval do
      alias_method :email_issue_attributes_without_due_date, :email_issue_attributes
      alias_method :email_issue_attributes, :email_issue_attributes_with_due_date
    end
  end

  module InstanceMethods
    def email_issue_attributes_with_due_date(issue, user, html)
      items = email_issue_attributes_without_due_date(issue, user, html)
      %w(due_date).each do |attribute|
        items << "#{l("field_#{attribute}")}: #{issue.send attribute}" unless html
        items << content_tag('strong', "#{l("field_#{attribute}")}: ") + (issue.send attribute) if html
      end
      items
    end
  end
end
