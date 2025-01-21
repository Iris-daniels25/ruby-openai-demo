# OpenAI Chatbot

**Description**

This is a simple command-line chatbot built in Ruby that interacts with OpenAI's GPT models. Users can have a conversation with the assistant, and it will respond based on the context of previous messages.

**Installation Instructions**

1. Clone the Repository

If you haven't already, clone this repository:

git clone https://github.com/your-username/openai-chatbot.git
cd openai-chatbot

2. Install Required Dependencies

Ensure you have Ruby installed, then install the required gems:

gem install openai dotenv

3. Set Up Your OpenAI API Key

This application requires an OpenAI API key to function. You need to create a .env file in the project directory and add your own API key.

**Steps to Get an OpenAI API Key:**

Sign up or log in to OpenAI: https://platform.openai.com/signup/

Go to API Keys

Generate a new secret key

Copy the key and store it securely

Add the API Key to the .env File

Create a .env file in the root of your project:

touch .env

Open the file and add your API key like this:

OPENAI_API_KEY=your_actual_api_key_here

Save the file.

Usage Instructions

Run the chatbot using:

ruby chatbot.rb

You can now start chatting with the assistant. Type your messages, and the chatbot will respond. To exit, type:

bye

Example Output

========================================
   Welcome to the OpenAI Chatbot!   
========================================

You: Hello!
Assistant: Hi there! How can I assist you today?
You: What's the capital of France?
Assistant: The capital of France is Paris.
You: bye
Goodbye! Have a great day! 😊

Troubleshooting

Common Issues & Fixes

Missing API Key Error (401 Unauthorized)

Ensure .env is correctly formatted and contains your API key.

Run:

echo $OPENAI_API_KEY

to verify that the key is loaded.

Invalid API Key

If you receive a 401 error, check if your API key is valid by testing it with:

curl https://api.openai.com/v1/models \  
  -H "Authorization: Bearer your_actual_api_key_here"

Dotenv Not Loading API Key

Restart your terminal and run:

source .env

Ensure require "dotenv/load" is included in your Ruby script.

**Future Enhancements**

Add support for saving chat history to a file.

Implement multiple language support.

Build a web or mobile interface for easier access.

**License**

This project is open-source and available under the MIT License.

