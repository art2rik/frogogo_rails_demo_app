class Api::UsersController < Api::ApiController
  before_action :authorize, except: :register

  # POST api/user/register
  # Register new user.
  def register
    user = User.new(phone: params[:phone],
                    password: params[:password],
                    name: params[:name])
    user.generate_api_key

    if user.save
      render_ok({user: user}))
    else
      render_error(user.errors)
    end
  end

  # GET api/user/index
  # Returns current user's info.
  def index
    user = user_by_key(params[:key])
    render_ok({user: user})
  end

  # POST api/user/update
  # Updates current user
  def update
    user = User.find_by_api_key(params[:key])

    user.phone = params[:phone] if params[:phone]
    user.name = params[:name] if params[:name]
    user.password = params[:password] if params[:password]

    password_change =  user.password_changed?
    if user.save
      payload = {user: user_by_key(params[:key])}
      payload.merge!(message: "Password successfully changed") if password_change
      render_ok(payload)
    else
      render_error(user.errors)
    end
  end

  # GET api/user/view/:id
  # Displays users data
  def view
    user = User.select(:id, :name, :phone).find_by_id(params[:id])

    if user.present?
      render_ok({user: user})
    else
      render_error("User with id #{params[:id]} isn't registered.")
    end
  end

  # GET api/user/list
  # List of users
  def list
    limit = params[:limit]
    offset = params[:offset]

    users = User.limit(limit).offset(offset).all.pluck(:id)
    render_ok(users)
  end
end
