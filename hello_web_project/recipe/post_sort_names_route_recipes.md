 "GET /names Route Design Recipe

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

```
# /names
What does it do: Return a 200 and a list of names (Julia, Mary, Karim)
Method: GET
Path: names
Query parameters: None
Body parameters: None
```

```
# /sort-names
What does it do: Return a 200 and a alphabetical list of passed names (Alice,Joe,Julia,Kieran,Zoe)
Method: post
Path: sort-names
Query parameters: None
Body parameters: names=Joe,Alice,Zoe,Julia,Kieran
```

```
# 404
What does it do: Return a 404 and a custom messgae
Method: any undefined
Path: any undefined
Query parameters: any
Body parameters: ant
```

## 2. Design the Response

Your response might return plain text, JSON, or HTML code. 

```
<!-- Response when the post is found: 200 OK -->

'Hi, the names you are looking for are: Julia, Mary, Karim'
```

```
assuming list is: 'Joe,Alice,Zoe,Julia,Kieran'
<!-- Response when list of names is passed: 200 OK -->
'Alice,Joe,Julia,Kieran,Zoe'
```

```
<!-- Response when post not fouind: 404 Not Found -->

'Hi there, sorry but we do not recognise that request. Please check and try again'

```

## 3. Write Examples

```
# Request:

GET /names

# Expected response:

Response for 200 OK
Body 
```

```
# Request:

POST /sort-names

# Expected response:

Response for 200 OK
Body 'Alice,Joe,Julia,Kieran,Zoe'
```

```
# Request:

GET /anything_else

# Expected response:

Response for 404 Not Found
```

## 4. Encode as Tests Examples

You should assert that the response status code is 200 and that the response body is the correct string.


```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /name" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/posts?id=1')
      expected_response = "Hi, the names you are looking for are: Julia, Mary, Karim"

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end
  end

  context "POST /sort_names" do
      it 'returns a sorted list of names' do
        response = post('sort_names?names=Joe,Alice,Zoe,Julia,Kieran')
        expected response = 'Alice,Joe,Julia,Kieran,Zoe'

        
        expect(response.status).to eq(200)
        expect(response.body).to eq(expected_response)

      end
  end

  context "404" do    
    it 'returns 404 Not Found' do
      response = get('/posts?id=276278')
      expected_response = "Hi there, sorry but we do not recognise that request. Please check and try again"

      expect(response.status).to eq(404)
      expect(response.body).to eq(expected_response)
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
