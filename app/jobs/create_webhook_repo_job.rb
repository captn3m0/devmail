class CreateWebhookRepoJob < ApplicationJob
  queue_as :default

  def perform(user)
    gh = Github.new user
    gh.setup_webhook('captn3m0/devmail','devmail',
      {
        :url  =>  'https://google.com',
        :content_type => 'json'
      },
      {
        :events =>  ['release', 'create'],
        :active =>  true
      }
    )
  end
end
