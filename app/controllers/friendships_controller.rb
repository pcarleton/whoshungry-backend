class FriendshipsController < ApplicationController
  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @friendships }
    end
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
    @friendship = Friendship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @friendship }
    end
  end

  # GET /friendships/new
  # GET /friendships/new.json
  def new
    @friendship = Friendship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @friendship }
    end
  end

  # GET /friendships/1/edit
  def edit
    @friendship = Friendship.find(params[:id])
  end
  
  # Post /frienships/bynum
  def bynum
    @user = User.find(params[:user_id])
    
    @friend = User.find_by_phone_number(params[:friend_number])
    
    if @friend
      @friendship = @user.friendships.build(:friend_id => @friend.id)
      success = @friendship.save
    else
      success = false
    end
    

    respond_to do |format|
      if success
        format.html { redirect_to @friendship, :notice => 'Friendship was successfully created.' }
        format.json { render :json => @friendship, :status => :created, :location => @friendship }
      else
        format.html { render :action => "new" }
        format.json { render :json => @friendship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @user = User.find(params[:user_id])
    @friendship = @user.friendships.build(:friend_id => params[:friend_id])

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to @friendship, :notice => 'Friendship was successfully created.' }
        format.json { render :json => @friendship, :status => :created, :location => @friendship }
      else
        format.html { render :action => "new" }
        format.json { render :json => @friendship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /friendships/1
  # PUT /friendships/1.json
  def update
    @friendship = Friendship.find(params[:id])

    respond_to do |format|
      if @friendship.update_attributes(params[:friendship])
        format.html { redirect_to @friendship, :notice => 'Friendship was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @friendship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to friendships_url }
      format.json { head :ok }
    end
  end
end
