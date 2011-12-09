class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end
  
  def avail
    @foodtimes = FoodTime.find_all_by_user_id(params[:id])
    
    respond_to do |format|
      format.html #nothing
      format.json { render :json => @foodtimes.to_json( 
              :only => [:dow, :start, :end, :comment]
        )}
    end
    
  end
  
  # Get /users/bynum/1
  # get /users/bynum/1.json
  
  def bynum
    @user = User.find_by_phone_number(params[:id])
    
    @users = User.all

    respond_to do |format|
      format.html { render :show}
#=begin
      format.json { render :json => @user.to_json(
        :include => { 
              :food_times => {
                :only => [:dow, :start, :end] 
              }, :friends =>  {}
        }
      )}
#=end
    #format.json {render :json => @user.to_json(:include => :friends)}
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    
    @users = User.all
    @avails = @user.food_times.sort { |a, b| a.dow <=> b.dow}

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user.to_json(
        :include => { 
          :food_times => {
                :only => [:dow, :start, :end, :comment] 
          }, :friends => {}
        }, :only => [:id, :phone_number]
      )}
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
