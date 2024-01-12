# Dungeons and Discord - Project README
# Front-End


Link to [Dungeons and Discord Website]() <br/>
Link to [Back-End Microservice](https://github.com/XanderHendry/dungeons_and_discord_be)

## Setup
- Ruby 3.2.2
- Rails 7.0.7.2
- [Faraday](https://github.com/lostisland/faraday) A gem to interact with APIs
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) A gem for code coverage tracking
- [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers) A gem for testing assertions
- [VCR](https://github.com/vcr/vcr) / [Webmock](https://github.com/bblimke/webmock) Both utilized to stub HTTP requests in tests to simulate API interactions
- [Omniauth](https://github.com/omniauth/omniauth) A gem for Oauth

## Installation Instructions
 - Fork Repository
 - `git clone <repo_name>`
 - `cd <repo_name>`
 - `bundle install`   
 - `rails db:{drop,create,migrate,seed}`
 - `rails server`
 - In your web browser, navigate to your local host `http://localhost:5000`
 Note: the localhost for this repo has been changed from the default 3000 to 5000 in order to run this localhost and the Back End's localhost simultaneously. 

## Project Description
Tired of having to lug around a sheet of paper with all of characters attributes for your Dungeons and Dragons games? You get all the way to the Dungeon Master's lair and forgot your character sheet? Cry no longer, weary traveler, Dungeons and Discord is here! Utilizing Discord to log in to the app, users are able to create characters by naming the character and selecting a class. Once the character has been created, this character is stored for you, so you don't have to remember that pesky piece of paper again! Players can also utilize Discord's server creation so a DM can host a game over the voice channel and a session can happen from the comfort of your home, car, anywhere with stable connection to the internet!

This repository is the front end of the project, which requires a Discord account to log-in. Once a user is logged in, they can create DnD characters which are saved and displayed on their user show page.

## OAuth
Dungeons and Discord leverages `omniauth` and `omniauth-discord` to handle an OAuth2.0 connection. OAuth2.0 is used for authentication from Discord, allowing the log-in of users and is required to use Dungeons and Discord.

The app requires access to your username, avatar, and banner from Discord, but does NOT grant access to modify or edit any of those details.

Read Discord's docs on [Oauth2](https://discord.com/developers/docs/topics/oauth2) to learn more. 
This is an example of what the discord client id and secret key will look like.

```
discord:
    client_id: <key>
    secret: <key>
```


## Contributors

- [Paul Bennett](https://www.linkedin.com/in/paul-bennett-dev/) -GitHub: [@pcbennett108](https://github.com/pcbennett108)
- [Allan Evans](https://www.linkedin.com/in/allan-evans-2c/) - GitHub: [@aevans27](https://github.com/aevans27)
- [Xander Hendry](https://www.linkedin.com/in/xander-hendry-70b804289/) - GitHub: [@XanderHendry](https://github.com/XanderHendry)
- [Joseph Lee](https://www.linkedin.com/in/joseph-lee702/) - GitHub: [@josephlee702](https://github.com/josephlee702)
- [Cory Powell](https://www.linkedin.com/in/coryrpow/) - GitHub: [@coryrpow](https://github.com/coryrpow)


### Web View
![]()
![]()
![]()