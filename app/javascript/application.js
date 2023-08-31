// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

import OpenAI from 'openai';

 const openai = new OpenAI({
   apiKey: ENV['OPENAI_API_KEY'], dangerouslyAllowBrowser: true // defaults to process.env["OPENAI_API_KEY"]
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
// main('Give me 5 creative date ideas specifically in Amsterdam-Oost (only the names). Return them in a csv format including only the headings.');
// main('Give me 5 italian restaurants in Amsterdam (only the names). Return them in a csv format including only the headings.');
