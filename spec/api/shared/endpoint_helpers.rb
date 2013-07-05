module Endpoint
  shared_examples_for 'an item endpoint' do |http_method, type|
    include_context "json response"
    let(:_method)   { http_method.to_sym }
    let(:_params)   { http_params if defined? http_params }
    let(:_headers)  { http_headers if defined? http_headers }
    context do
      before { send _method, endpoint, _params, _headers }
      it_behaves_like "a json item", type
    end
  end

  shared_examples_for 'an array endpoint' do |http_method, type|
    include_context "json response"
    let(:_params)   { http_params if defined? http_params }
    let(:_headers)  { http_headers if defined? http_headers }
    let(:_method)   { http_method.to_sym if defined? http_method }

    context do
      before { send _method, endpoint, _params, _headers }
      it_behaves_like "a json list", type
    end
  end
end