require 'app/site/languages'

class ExercismApp < Sinatra::Base

  get '/' do
    if current_user.guest?
      current = App::Site::Languages.new(Exercism.current)
      upcoming = App::Site::Languages.new(Exercism.upcoming)
      erb :"site/index", locals: {current: current, upcoming: upcoming}
    else
      erb :"site/dashboard", locals: {submission: Work.new(current_user).random}
    end
  end

  get '/privacy' do
    erb :"site/privacy"
  end

  get '/about' do
    erb :"site/about"
  end

end
