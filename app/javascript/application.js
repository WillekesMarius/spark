// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

import OpenAI from 'openai';
const token = document.querySelector('#open-ai-token').dataset.token
console.log(document.querySelector('#open-ai-token'))

const openai = new OpenAI({
  apiKey: token, dangerouslyAllowBrowser: true // defaults to process.env["OPENAI_API_KEY"]
});

async function main(user_message) {
  const completion = await openai.chat.completions.create({
    model: 'gpt-3.5-turbo',
    messages: [
      { role: 'user', content: user_message },
    ],
  });

  console.log(completion.choices[0]["message"]["content"]);
  console.log(new Date().toLocaleTimeString())
}
console.log(new Date().toLocaleTimeString())
main('Give me 3 italian restaurants in Amsterdam-West, only the names.');
main('Give me 3 italian restaurants in Amsterdam-West, only the names.');
main('Give me 3 different italian restaurants in Amsterdam-West, only the names.');
