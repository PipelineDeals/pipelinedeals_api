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
PipelineDeals.configure do |config|
  config.api_key = 'abcd1234'
end
```

## Getting a single deal, person, or company:

```ruby
deal = PipelineDeals::Deal.find(1234)      # find the deal
deal.name = 'blah2'         # change an attribute
deal.save                   # re-save the deal to the site
deal.people                 # associations are respected
deal.people.first.id
deal.person_ids           
```

## Fetching collections of deals, people, or companies

```ruby
deals = PipelineDeals::Deal.find(:all)                                             # find(:all) is supported
deals = PipelineDeals::Deal.find(:all, params: {conditions: {deal_name: 'blah'}})
deals = PipelineDeals::Deal.where(conditions: {deal_name: 'blah'})
```

### Filtering

You can filter your list by adding a `conditions` parameter.  All
conditions are listed in the [Pipelinedeals API documentation](https://www.pipelinedeals.com/api/docs)

```ruby
deals = PipelineDeals::Deal.where(conditions: {deal_value: {from: '500', to: '1000'}})
```

### Pagination

All list of things in the PipelineDeals API are paginated.  The default number of items per page is 200.

You can access the current page and total by calling `.pagination` on the list:

```ruby
deals = PipelineDeals::Deal.find(:all)
deals.pagination
=> {"per_page"=>200, "total"=>14, "page_var"=>"page", "pages"=>1, "page"=>1}
```

You can modify the page you are on when requesting:

```ruby
deals = PipelineDeals::Deal.find(:all, params: { page: 2})
# or you can use where
deals = Deal.where({page: 2})
```

You can modify the number per page as well:

```ruby
deals = PipelineDeals::Deal.where(per_page: 2, page: 3)
deals.pagination
=> {"per_page"=>3, "total"=>14, "page_var"=>"page", "pages"=>8, "page"=>2}
```

## Admin data

Admin data is currently read-only.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
