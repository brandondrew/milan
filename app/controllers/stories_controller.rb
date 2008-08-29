class StoriesController < ApplicationController
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

    # TODO: REFACTOR------------------------------
    # set the display date
    if @story.publish_at.nil?
      @display_date = @story.created_at
    else
      @display_date = @story.publish_at
    end
    @display_date_string = Date::MONTHNAMES[@display_date.month], " ", @display_date.day, " ", @display_date.year
    # display_date_string sounds redundant: you'd think display_date was already a string, since you're going to display it, no?
    # but of course the "display" part of display_date is because it's going to be used to display either the creation date or the publishing date.
    # maybe I should change display_date to something else, and then change display_date_string as well, to avoid confusion
    #---------------------------------------------

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

    # TODO: REFACTOR------------------------------
    # set the display date
    if @story.publish_at.nil?
      @display_date = @story.created_at
    else
      @display_date = @story.publish_at
    end
    @display_date_string = Date::MONTHNAMES[@display_date.month], " ", @display_date.day, " ", @display_date.year
    # display_date_string sounds redundant: you'd think display_date was already a string, since you're going to display it, no?
    # but of course the "display" part of display_date is because it's going to be used to display either the creation date or the publishing date.
    # maybe I should change display_date to something else, and then change display_date_string as well, to avoid confusion
    #---------------------------------------------

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
end
