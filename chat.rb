require "openai"
require "dotenv/load"

# Initialize OpenAI client
client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_KEY"))

# Set up initial system message
message_list = [
  { "role" => "system", "content" => "You are a helpful assistant." }
]

puts "=" * 50
puts "Hello! How can I help you today? (Type 'bye' to exit)"
puts "=" * 50

# Start the conversation loop
loop do
  print "\nYou: " # Adds a prefix for clarity
  user_input = gets.chomp.strip

  break if user_input.downcase == "bye"

  # Add user's message to history
  message_list.push({ "role" => "user", "content" => user_input })

  begin
    # Send the message list to the OpenAI API
    api_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: message_list
      }
    )

    # Extract assistant's response safely
    choices = api_response.fetch("choices", [])
    if choices.empty?
      puts "Assistant: Sorry, I didn't get that. Please try again."
      next
    end

    first_choice = choices.first
    message = first_choice.fetch("message", {})
    assistant_response = message.fetch("content", "I am unable to generate a response at the moment.")

    # Display assistant's response
    puts "Assistant: #{assistant_response}"

    # Add assistant's response to history
    message_list.push({ "role" => "assistant", "content" => assistant_response })

  rescue StandardError => e
    puts "Error: Unable to connect to OpenAI API. #{e.message}"
    next
  end
end

puts "\nGoodbye! Have a great day! 😊"
