# Explore More

An React website application to help you explore more mountain biking and hiking trails near you! Add them to your bucket-list, your favorites, or check them off and watch your completed lists grow!

# Table Of Contents 
- [Description](https://github.com/sbrook13/explore_more_backend#description)
- [Example Code](https://github.com/sbrook13/explore_more_backend#example-code)
- [Technology Used](https://github.com/sbrook13/explore_more_backend#technology-used)
- [Setting up for the Application](https://github.com/sbrook13/explore_more_backend#setting-up-for-the-application)
- [Main Features](https://github.com/sbrook13/explore_more_backend#main-features)
- [Features in Progress](https://github.com/sbrook13/explore_more_backend#features-in-progress)
- [Contact Information](https://github.com/sbrook13/explore_more_backend#contact-information)
- [Link to Frontend Repo](https://github.com/sbrook13/explore_more_backend#link-to-frontend-repo)

## Description

Built from a passion of finding new trails to hike and bike, I created Explore More to be able to discover more trails near home, keep track of the ones I have explored, and add new ones to the bucket list. Using the Mountain Bike Project API, the Hiking Project API, Google Maps Geocoding API, users can find trails near home and save them in their secure profile.

## Example Code

### Login Method

![User Serializer](https://i.imgur.com/1oA3iXT.png)

### User Model

```
class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def index
      @users = User.all
      render json: @users, include: [:favorites, :bucket_lists, :completed_trails]
  end

  def home
    render json: @user, include: [:favorites, :bucket_lists, :completed_trails]
  end

  def create
      @user = User.new(user_params)
      if @user.valid?
          @user.save
          payload ={ user_id: @user.id }
          secret = Rails.application.secret_key_base
          token = JWT.encode payload, secret

          render json: {token: token, user: @user}, status: :created
      else
          render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
      end
  end

  private

  def user_params
      params.require(:user).permit([
        :name, 
        :username, 
        :password, 
        :address, 
      ])
  end
end
```

### Create Favorite Trail

![Favorite Trail](https://i.imgur.com/zSA5sYx.png)

## Technology Used

- Ruby on Rails
- sqlite3 database

## Setting up for the application

```
  bundle install
```

``` 
  rails db:migrate  
  rails db:seed 
```

To start the server run
``` 
  rails s
```

## Main Features

- User can sign up/sign in with authentication.
- User can add trails to their "bucket-list", their completed list, or their favorites for easy access and motivation.
- Guests can view trails based on proximity to the address they enter.

## Features in Progress

- Geocoding the location (currently default is set 30 miles within to Denver, CO)
- Adding journal entries and personal ratings to your completed trails!

## Contact Information

Created by [Shelley Brook](https://www.linkedin.com/in/sbrook13/)


## Link to Frontend Repo

https://github.com/sbrook13/explore-more-frontend

