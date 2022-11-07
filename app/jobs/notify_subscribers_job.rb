class NotifySubscribersJob < ApplicationJob
  queue_as :default

  def perform(record)
    event = record.event
    all_emails = event.subscriptions.map(&:user_email) + [event.user.email] - [record.user&.email]

    case record
    when Comment
      all_emails.each { |email| EventMailer.comment(record, email).deliver_later }
    when Photo
      all_emails.each { |email| EventMailer.photo(record, email).deliver_later }
    when Subscription
      EventMailer.subscription(record).deliver_later
    end
  end
end
