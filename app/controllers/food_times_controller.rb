class FoodTimesController < ApplicationController
  # GET /food_times
  # GET /food_times.json
  def index
    @food_times = FoodTime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @food_times }
    end
  end

  # GET /food_times/1
  # GET /food_times/1.json
  def show
    @food_time = FoodTime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @food_time }
    end
  end

  # GET /food_times/new
  # GET /food_times/new.json
  def new
    @food_time = FoodTime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @food_time }
    end
  end

  # GET /food_times/1/edit
  def edit
    @food_time = FoodTime.find(params[:id])
  end

  # POST /food_times
  # POST /food_times.json
  def create
    @food_time = FoodTime.new(params[:food_time])

    respond_to do |format|
      if @food_time.save
        format.html { redirect_to @food_time, :notice => 'Food time was successfully created.' }
        format.json { render :json => @food_time, :status => :created, :location => @food_time }
      else
        format.html { render :action => "new" }
        format.json { render :json => @food_time.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /food_times/1
  # PUT /food_times/1.json
  def update
    @food_time = FoodTime.find(params[:id])

    respond_to do |format|
      if @food_time.update_attributes(params[:food_time])
        format.html { redirect_to @food_time, :notice => 'Food time was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @food_time.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /food_times/1
  # DELETE /food_times/1.json
  def destroy
    @food_time = FoodTime.find(params[:id])
    @food_time.destroy

    respond_to do |format|
      format.html { redirect_to food_times_url }
      format.json { head :ok }
    end
  end
end
