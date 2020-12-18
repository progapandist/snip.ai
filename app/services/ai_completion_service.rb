class AiCompletionService
  def initialize(user_prompt)
    @user_prompt = user_prompt
    @client = OpenAI::Client.new(api_key: Rails.application.credentials.dig(:openai_key), default_engine: "davinci")
    @training_prompt = File.read(Dir.glob(Rails.root.join("config", "prompts", "*.txt")).sample)
  end

  def call
    prompt = @training_prompt + "HOWTO #{@user_prompt}"
    # TODO: Pass parameters from the outside
    answer = @client.completions(
      prompt: prompt,
      max_tokens: prompt.length + 300,
      stop: ["HOWTO:", "####"],
      frequency_penalty: 0,
      presence_penalty: 0.08,
      top_p: 0.1
    )
    answer.choices.first.text.gsub("####", "")
  end
end
