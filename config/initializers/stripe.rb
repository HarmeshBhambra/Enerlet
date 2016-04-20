Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_KxuVlkIE1Af7IsgZtrPbpPZc'],
  :secret_key      => ENV['sk_test_HP8jXYF6HQoOGUwNfyU5FR4F']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
