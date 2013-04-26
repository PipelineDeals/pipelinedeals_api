# PipelineDeals API gem

The PipelineDeals API gem is a nice ruby wrapper around the PipelineDeals API.  It will allow you full CRUD access to all of the core PipelieDeals components in a very easy-to-use library.

## Installation

Add this line to your application's Gemfile:

    gem 'pipeline_deals'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pipeline_deals

## Usage

First and foremost, register your api key:

```ruby
PipelineDeals.api_key = 'abcd1234'
```


### Getting a single deal, person, or company:

```ruby
deal = Deal.find(1234)      # find the deal
deal.name = 'blah2'         # change an attribute
deal.save                   # re-save the deal to the site
deal.people                 # associations are respected
deal.people.first.id
deal.person_ids           
```

### Fetching collections of deals, people, or companies

```ruby
deals = Deal.find(:all)
deals = Deal.find(:all, params: {per_page: 5, page: 2})
deals = Deal.find(:all, params: {conditions: {deal_name: 'blah'}})
deals = Deal.where(conditions: {deal_name: 'blah'})
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
