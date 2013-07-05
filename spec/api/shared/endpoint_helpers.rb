module Endpoint
  shared_examples_for 'an item endpoint' do |http_method, type|
    include_context "json response"
    let(:_method)   { http_method.to_sym }
    let(:_payload)  { payload if defined? payload }
    let(:_headers)  { headers if defined? headers }
    context do
      before { send _method, endpoint, _payload, _headers }
      it_behaves_like "a json item", type
    end
  end

  shared_examples_for 'an array endpoint' do |http_method, type|
    include_context "json response"
    let(:_method)   { http_method.to_sym }
    let(:_payload)  { payload if defined? payload }
    let(:_headers)  { headers if defined? headers }

    context do
      before { send _method, endpoint, _payload, _headers }
      it_behaves_like "a json list", type
    end
  end
end