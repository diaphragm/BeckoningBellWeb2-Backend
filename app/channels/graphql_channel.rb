class GraphqlChannel < ApplicationCable::Channel
  def subscribed
    @subscription_ids = []
  end

  def execute(data)
    query = data['query']
    variables = ensure_hash(data['variables'])
    operation_name = data['operationName']
    context = {
      # current_user: current_user,
      # Make sure the channel is in the context
      channel: self,
    }

    result = BeckoningBellWebSchema.execute({
      query: query,
      context: context,
      variables: variables,
      operation_name: operation_name
    })

    payload = {
      result: result.subscription? ? {data: nil} : result.to_h,
      more: result.subscription?,
    }

    # Track the subscription here so we can remove it
    # on unsubscribe.
    if result.context[:subscription_id]
      @subscription_ids << context[:subscription_id]
    end

    transmit(payload)
  end

  def unsubscribed
    @subscription_ids.each {|sid|
      CardsSchema.subscriptions.delete_subscription(sid)
    }
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError.new("Unexpected parameter: #{ambiguous_param}")
    end
  end
end

# test command
# {"command":"subscribe","identifier":"{\"channel\":\"GraphqlChannel\"}"}
# {"command":"message","identifier":"{\"channel\":\"GraphqlChannel\"}","data":"{\"action\":\"execute\",\"query\":\"subscription{newMessage(bellId:1){body}}\"}"}
