class StoriesController < ApplicationController
  before_filter :authorize, :except => [:index, :show]

  # FAILING:
  # auto_complete_for :story, :author
  # auto_complete_for :story, :section


  # GET /stories
  # GET /stories.xml
  def index
    @stories = Story.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.xml
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.xml
  def new
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
    # shouldn't there be a respond_to block here????? 
  end

  # POST /stories
  # POST /stories.xml
  def create
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        flash[:notice] = 'Story was successfully created.'
        format.html { redirect_to(@story) }
        format.xml  { render :xml => @story, :status => :created, :location => @story }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.xml
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        flash[:notice] = 'Story was successfully updated.'
        format.html { redirect_to(@story) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.xml
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to(stories_url) }
      format.xml  { head :ok }
    end
  end
  
  ####################################################################################
  protected
  #########  I shouldn't need these since they're already in application_helper.rb, 
  #########  but for some reason Rails is complaining they are undefined... ?$%&*@#%!
  #########  TODO: debug why the stories controller has no access to global helpers
  def admin?
    # this will do for now... obviously not robust enough for production...
    request.remote_ip == "127.0.0.1"
  end
  
  def authorize
    unless admin?
      flash[:error] = "Unauthorized access"
      redirect_to index
      false
    end
  end
  
  
  ####################################################################################
  
  
  
  
end
